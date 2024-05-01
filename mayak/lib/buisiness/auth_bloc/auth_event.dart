// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthEvent {}

class LoginEvent extends AuthEvent {
  String username;
  String password;
  LoginEvent({
    required this.username,
    required this.password,
  });
}

class RegisterEvent extends AuthEvent {}

class LogOutEvent extends AuthEvent {}

class GetUserEvent extends AuthEvent {}
