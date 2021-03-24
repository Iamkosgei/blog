import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../services/services.dart';
import '../../utils/utils.dart';
import 'package:meta/meta.dart';

part 'startup_event.dart';
part 'startup_state.dart';

class StartupBloc extends Bloc<StartupEvent, StartupState> {
  StartupBloc() : super(StartupInitial());

  @override
  Stream<StartupState> mapEventToState(
    StartupEvent event,
  ) async* {
    if (event is CheckAuthState) {
      //check auth state
      await Future.delayed(Duration(seconds: 1));
      SharedPreferenceService _sp = locator.get<SharedPreferenceService>();
      bool _userLoggedIn = await _sp.sharedPrefrefContainsKey(tokenKey);
      yield (UserAlreadySignedIn(_userLoggedIn));
    }
  }
}
