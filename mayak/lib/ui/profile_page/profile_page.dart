import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mayak/buisiness/auth_bloc/auth_bloc.dart';
import 'package:mayak/ui/constants.dart';
import 'package:mayak/ui/profile_page/components/about_app_page.dart';
import 'package:mayak/ui/profile_page/components/about_restaurant_page.dart';
import 'package:mayak/ui/profile_page/components/about_widget.dart';

import 'package:mayak/ui/profile_page/components/client_data_page.dart';
import 'package:mayak/ui/profile_page/components/delivery_map_page.dart';
import 'package:mayak/ui/profile_page/components/privacy_policy_page.dart';
import 'package:mayak/ui/profile_page/components/social_network_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: width * 0.98,
          child: Column(children: [
            // Padding(padding: EdgeInsets.only(top: height * 0.06)),
            Container(
              width: MediaQuery.of(context).size.width,
              height: height * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight, image: AssetImage('assets/MK.png')),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: height * 0.03)),

            Padding(padding: EdgeInsets.only(top: height * 0.02)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    child: Container(
                        width: width * 0.95,
                        height: height * 0.1,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: Color.fromARGB(74, 88, 88, 88)),
                          borderRadius: BorderRadius.circular(15.0),

                          color: kButtonColor,
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/MK.png",
                              ),
                              opacity: 0.1,
                              fit: BoxFit.fitWidth),
                          // button text
                        ),
                        child: Center(
                          child: Text(
                            "Данные пользователя",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily:
                                    GoogleFonts.merriweather().fontFamily,
                                color: Color.fromARGB(217, 233, 233, 233),
                                fontSize: height * 0.02,
                                height: 1,
                                fontWeight: FontWeight.normal),
                          ),
                        )),
                    onTap: () {
                      AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider<AuthBloc>.value(
                                value: authBloc, //
                                child: ClientDataPage()),
                          ));
                    }),
              ],
            ),

            Padding(padding: EdgeInsets.only(top: height * 0.02)),
            Align(
                alignment: Alignment.center, //or choose another Alignment
                child: Container(
                    color: Colors.transparent,
                    width: width - (0.01 * width),
                    child: SocialNetworkWidget())),
          ]),
        ),
      ],
    );
  }
}
