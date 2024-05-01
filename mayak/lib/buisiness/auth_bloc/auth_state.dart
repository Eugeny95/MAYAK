part of 'auth_bloc.dart';

class AuthState {
  AuthStatus status;
  UserData? user;
  AuthState({required this.status, this.user});
}
