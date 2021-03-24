part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginUser extends AuthEvent {
  final String email, password;

  LoginUser(this.email, this.password);
}
