import 'package:auth_feature/data/auth_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mayak/buisiness/auth_bloc/auth_bloc.dart';
import 'package:mayak/ui/auth_page/signin_or_signup_screen.dart';
import 'package:mayak/ui/constants.dart';
import 'package:mayak/ui/profile_page/components/remove_account_dialog.dart';

class ClientDataPage extends StatefulWidget {
  @override
  _ClientDataPageState createState() {
    return _ClientDataPageState();
  }
}

class _ClientDataPageState extends State<ClientDataPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(219, 70, 70, 70)),
          backgroundColor: kPrimaryColor,
          title: Text('Данные пользователя',
              style: TextStyle(
                  color: Color.fromARGB(221, 51, 51, 51), fontSize: 18))),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          print('users firstname = ${state.user!.first_name}');
          print('status = ${state.status}');
          if (state.status == AuthStatus.unauthorized) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: width * 0.7, child: Image.asset('assets/MK.png')),
                  Padding(padding: EdgeInsets.only(top: 70)),
                  Text('Вы не авторизованы'),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      child: Text(
                        'Войти',
                        style: TextStyle(
                            color: Color.fromARGB(255, 237, 237, 237)),
                      ),
                      onPressed: () async {
                        AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BlocProvider<AuthBloc>.value(
                                      value: authBloc, //
                                      child: SigninOrSignupScreen()),
                            ));
                        authBloc.add(RegisterEvent());
                      }),
                ],
              ),
            );
          }

          if (state.status == AuthStatus.initial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Column(children: [
              // Padding(padding: EdgeInsets.only(top: 40)),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   child: const Text('Go back!'),
              // ),
              Padding(padding: EdgeInsets.only(top: 40)),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/PinBon.png",
                        ),
                        opacity: 0.15)),
                width: width * 0.9,
                child: Column(children: [
                  Container(
                    height: height * 0.06,
                    child: IntrinsicHeight(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 25,
                              color: kIconsColor,
                            ),
                            SizedBox(width: width * 0.05),
                            Text(
                              state.user!.first_name,
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        Divider(color: Color.fromARGB(207, 51, 51, 51)),
                      ],
                    )),
                  ),
                  Container(
                    height: height * 0.06,
                    child: IntrinsicHeight(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.people_alt_outlined,
                              size: 25,
                              color: kIconsColor,
                            ),
                            SizedBox(width: width * 0.05),
                            Text(
                              state.user!.last_name,
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        Divider(color: const Color.fromARGB(207, 51, 51, 5)),
                      ],
                    )),
                  ),
                  Container(
                    height: height * 0.06,
                    child: IntrinsicHeight(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.phone_iphone,
                              size: 25,
                              color: kIconsColor,
                            ),
                            SizedBox(width: width * 0.05),
                            Text(
                              state.user!.username,
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        Divider(color: const Color.fromARGB(207, 51, 51, 55)),
                      ],
                    )),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: height * 0.06,
                    child: IntrinsicHeight(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              size: 25,
                              color: kIconsColor,
                            ),
                            SizedBox(width: width * 0.05),
                            Text(
                              DateFormat('dd.MM.yyyy')
                                  .format(state.user!.date_birth),
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        Divider(color: const Color.fromARGB(207, 51, 51, 5)),
                      ],
                    )),
                  ),
                  Container(
                    height: height * 0.06,
                    child: IntrinsicHeight(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              size: 25,
                              color: kIconsColor,
                            ),
                            SizedBox(width: width * 0.05),
                            Text(
                              state.user!.email,
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        Divider(color: const Color.fromARGB(207, 51, 51, 5)),
                      ],
                    )),
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                                color: Colors.white, width: 0.3) // <-- Radius
                            ),
                        elevation: 5,
                        minimumSize: Size(height * 0.43, width * 0.13),
                      ),
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
                        // userProfile.requestUserData();

                        // if (Validator.isPhoneValid(userProfile.phone) != null) {
                        //   const snackBar = SnackBar(
                        //     content: Text('Введите корректный телефон'),
                        //   );
                        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        //   return;
                        // }
                        // if (Validator.isEmailValid(userProfile.email) != null) {
                        //   const snackBar = SnackBar(
                        //     content: Text('Введите корректный email'),
                        //   );
                        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        //   return;
                        // }
                        // userProfile.updateProfile();

                        // TODO: validator
                      },
                      child: Text('Выйти из профиля',
                          style: TextStyle(
                              color: Color.fromARGB(255, 227, 52, 52)))),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextButton(
                      onPressed: () async {
                        String accessToken = state.user!.accessToken;
                        bool? isDeleteDialog = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return RemovaAccountDialog();
                          },
                        );
                        if (isDeleteDialog == null) return;
                        if (isDeleteDialog) {
                          Response response = await Dio().delete(
                              'http://147.45.109.158:8881/auth/delete/',
                              options: Options(headers: <String, String>{
                                'authorization': 'Bearer ${accessToken}'
                              }));
                          BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Ваш аккаунт успешно удален')));
                        }
                      },
                      child: Text('Удалить аккаунт',
                          style: TextStyle(
                              color: const Color.fromARGB(207, 51, 51, 5)))),
                ]),
              ),
            ]),
          );
        },
      ),
    );
  }
}
