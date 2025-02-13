import 'package:auth_feature/data/auth_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:auth_feature/auth_feature.dart';

void main() {
  test('register test', () async {
    UserData user = UserData();
    user.username = '89991119933';
    user.first_name = 'Ivan';
    user.last_name = 'Ivanov';
    user.email = 'aqhy@ml.ru';
    user.password = '12345678';
    user.date_birth = DateTime.now();

    AuthStatus status = await AuthService().register(
        userData: user,
        registerUrl: 'http://90.156.208.220:9000/auth/register/');
    print(status);
  });

  test('login test', () async {
    UserData user = UserData();
    user.username = '89991119933';
    user.password = '12345678';

    user = await AuthService().loginOnline(
        username: user.username,
        password: user.password,
        deviceType: '',
        message_service_token: '',
        authUrl: 'http://90.156.208.220:9000/auth/login/');
    print(user.authStatus);
    print(user.accessToken);
  });
}
