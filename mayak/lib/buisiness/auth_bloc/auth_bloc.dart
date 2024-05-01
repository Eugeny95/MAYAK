import 'package:auth_feature/auth_feature.dart';
import 'package:auth_feature/data/auth_data.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthService authService = AuthService();
  AuthStatus authStatus = AuthStatus.unauthorized;

  UserData getUser() {
    return authService.user;
  }

  Future<AuthStatus> logIn(
      {required String username, required String password}) async {
    authStatus = await authService.logIn(
        cloudMessageToken: '',
        deviceType: '',
        username: username,
        password: password,
        authUrl: 'http://147.45.109.158:8881/auth/login/');
    return authStatus;
  }

  Future<AuthStatus> registerUser(UserData userData) async {
    print('register user');
    authStatus = await authService.register(
        userData: userData,
        registerUrl: 'http://147.45.109.158:8881/auth/register/');
    return authStatus;
  }

  void init() async {
    authStatus = await authService.logIn(
        username: '',
        password: '',
        cloudMessageToken: '',
        deviceType: '',
        authUrl: '');
  }

  bool isAuth() {
    if (authStatus == AuthStatus.authorized &&
        authService.user.accessToken != '') {
      return true;
    } else {
      return false;
    }
  }

  String getAccessToken() {
    return authService.user.accessToken;
  }

  String getPhone() {
    return authService.user.username;
  }

  AuthBloc() : super(AuthState(status: AuthStatus.initial)) {
    on<LoginEvent>((event, emit) async {
      authStatus = await authService.logIn(
          cloudMessageToken: '',
          deviceType: '',
          username: event.username,
          password: event.password,
          authUrl: 'http://147.45.109.158:8881/auth/login/');
      emit(AuthState(status: authStatus, user: authService.user));
    });

    on<GetUserEvent>((event, emit) async {
      if (isAuth()) {
        emit(AuthState(status: authStatus, user: authService.user));
      } else {
        emit(
            AuthState(status: AuthStatus.unauthorized, user: authService.user));
      }
    });
    on<RegisterEvent>((event, emit) async {
      print('refresh');
      print('firstname is ${authService.user.first_name}');

      emit(AuthState(status: authStatus, user: authService.user));
    });

    on<LogOutEvent>((event, emit) async {
      authService.logOut();
      emit(AuthState(status: AuthStatus.unauthorized, user: authService.user));
    });
  }
}
