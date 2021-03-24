import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blog/services/services.dart';
import 'package:blog/utils/locator.dart';
import 'package:blog/utils/utils.dart';
import '../../repositories/repos.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc({@required this.authRepo}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginUser) {
      yield AuthLoading();

      try {
        var _res = await authRepo.loginUser(event.email, event.password);
        log("TOken------ ${_res.token}");

        locator
            .get<SharedPreferenceService>()
            .addStringToSharedPref(tokenKey, _res.token);
        yield AuthSuccess();
      } catch (e) {
        log(e.toString());
        yield AuthError(e.toString());
      }
    }
  }
}
