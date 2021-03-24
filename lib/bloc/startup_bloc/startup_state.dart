part of 'startup_bloc.dart';

@immutable
abstract class StartupState {}

class StartupInitial extends StartupState {}

class UserAlreadySignedIn extends StartupState {
  final bool userSignedIn;

  UserAlreadySignedIn(this.userSignedIn);
}
