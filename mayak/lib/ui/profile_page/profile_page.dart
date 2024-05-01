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
            Padding(padding: EdgeInsets.only(top: height * 0.06)),
            Container(
              width: MediaQuery.of(context).size.width,
              height: height * 0.15,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/PinBon.png')),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: height * 0.03)),
            Align(
                alignment: Alignment.center, //or choose another Alignment
                child: Container(
                    color: Colors.transparent,
                    width: width - (0.01 * width),
                    child: AboutWidget())),
            Padding(padding: EdgeInsets.only(top: height * 0.02)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    child: Container(
                        width: height * 0.22,
                        height: width * 0.43,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: Color.fromARGB(74, 88, 88, 88)),
                          borderRadius: BorderRadius.circular(15.0),

                          color: kButtonColor,
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/PinBon.png",
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
                                color: Color.fromARGB(217, 34, 34, 34),
                                fontSize: height * 0.03,
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

                Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            child: Container(
                                width: height * 0.1,
                                height: width * 0.2,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromARGB(74, 88, 88, 88)),
                                  borderRadius: BorderRadius.circular(15.0),

                                  color: kButtonColor,
                                  image: DecorationImage(
                                      image: AssetImage("assets/PinBon.png"),
                                      opacity: 0.1,
                                      fit: BoxFit.fitWidth),
                                  // button text
                                ),
                                child: Center(
                                  child: Text(
                                    "Про ресторан",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.merriweather()
                                            .fontFamily,
                                        color: Color.fromARGB(236, 34, 34, 34),
                                        fontSize: height * 0.018,
                                        height: 1,
                                        fontWeight: FontWeight.normal),
                                  ),
                                )),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AboutRestaurantPage()),
                              );
                            }),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        GestureDetector(
                            child: Container(
                                width: height * 0.1,
                                height: width * 0.2,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromARGB(74, 88, 88, 88)),
                                  borderRadius: BorderRadius.circular(15.0),

                                  color: kButtonColor,
                                  image: DecorationImage(
                                      image: AssetImage("assets/PinBon.png"),
                                      opacity: 0.1,
                                      fit: BoxFit.fitWidth),
                                  // button text
                                ),
                                child: Center(
                                  child: Text(
                                    "Карта доставки",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.merriweather()
                                            .fontFamily,
                                        color: Color.fromARGB(217, 34, 34, 34),
                                        fontSize: height * 0.018,
                                        height: 1,
                                        fontWeight: FontWeight.normal),
                                  ),
                                )),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DeliveryMapPage()),
                              );
                            }),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    GestureDetector(
                        child: Container(
                            width: height * 0.2,
                            height: width * 0.2,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: Color.fromARGB(74, 88, 88, 88)),
                              borderRadius: BorderRadius.circular(15.0),

                              color: kButtonColor,
                              image: DecorationImage(
                                  image: AssetImage("assets/PinBon.png"),
                                  opacity: 0.1,
                                  fit: BoxFit.fill),
                              // button text
                            ),
                            child: Center(
                              child: Text(
                                "Политика конфиденциальности",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.merriweather().fontFamily,
                                    color: Color.fromARGB(217, 34, 34, 34),
                                    fontSize: height * 0.017,
                                    height: 1,
                                    fontWeight: FontWeight.normal),
                              ),
                            )),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacyPolicyPage()),
                          );
                        }),
                  ],
                ),
                // ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(12),
                //           side: BorderSide(
                //               color: Colors.white, width: 0.2) // <-- Radius
                //           ),
                //       elevation: 5,
                //       minimumSize: Size(height * 0.1, width * 0.12),
                //     ),
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => AboutRestaurantPage()),
                //       );
                //     },
                //     child: Row(
                //       children: [
                //         Icon(
                //           Icons.restaurant,
                //           size: 18,
                //           color: kIconsColor,
                //         ),
                //         SizedBox(
                //           width: width * 0.03,
                //         ),
                //         Text('О ресторане',
                //             style: TextStyle(color: kIconsColor)),
                //       ],
                //     )),
              ],
            ),
            // Padding(padding: EdgeInsets.only(top: height * 0.015)),

            // Padding(padding: EdgeInsets.only(top: height * 0.005)),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //           side: BorderSide(
            //               color: Colors.white, width: 0.2) // <-- Radius
            //           ),
            //       elevation: 5,
            //       minimumSize: Size(height * 0.43, width * 0.12),
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => DeliveryMapPage()),
            //       );
            //     },
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.map,
            //           size: 22,
            //           color: kIconsColor,
            //         ),
            //         SizedBox(
            //           width: width * 0.03,
            //         ),
            //         Text('Карта доставки',
            //             style: TextStyle(color: kIconsColor)),
            //       ],
            //     )),
            // Padding(padding: EdgeInsets.only(top: height * 0.005)),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //           side: BorderSide(
            //               color: Colors.white, width: 0.2) // <-- Radius
            //           ),
            //       elevation: 5,
            //       minimumSize: Size(height * 0.43, width * 0.12),
            //     ),
            //     onPressed: () async {
            //       final url =
            //           "https://yandex.ru/maps/org/mayak/124027389896/panorama/?l=stv%2Csta&ll=39.198694%2C51.661022&panorama%5Bdirection%5D=291.296426%2C-0.357831&panorama%5Bfull%5D=true&panorama%5Bpoint%5D=39.198682%2C51.661021&panorama%5Bspan%5D=121.107985%2C60.000000&utm_source=share&z=20";
            //       if (await canLaunch(url)) {
            //         await launch(
            //           url,
            //         );
            //       }
            //     },
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.touch_app_outlined,
            //           size: 18,
            //           color: kIconsColor,
            //         ),
            //         SizedBox(
            //           width: width * 0.03,
            //         ),
            //         Text('Виртуальный тур по ресторану',
            //             style: TextStyle(color: kIconsColor)),
            //       ],
            //     )),
            // Padding(padding: EdgeInsets.only(top: height * 0.015)),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //           side: BorderSide(
            //               color: kIconsColor, width: 0.2) // <-- Radius
            //           ),
            //       elevation: 5,
            //       minimumSize: Size(height * 0.43, width * 0.12),
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => PrivacyPolicyPage()),
            //       );
            //     },
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.privacy_tip_outlined,
            //           size: 22,
            //           color: kIconsColor,
            //         ),
            //         SizedBox(
            //           width: width * 0.03,
            //         ),
            //         Text('Политика конфиденциальности',
            //             style: TextStyle(
            //               color: kIconsColor,
            //             )),
            //       ],
            //     )),
            // Padding(padding: EdgeInsets.only(top: height * 0.005)),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //           side: BorderSide(
            //               color: kIconsColor, width: 0.2) // <-- Radius
            //           ),
            //       elevation: 5,
            //       minimumSize: Size(height * 0.43, width * 0.12),
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => AboutAppPage()),
            //       );
            //     },
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.phone_iphone,
            //           size: 22,
            //           color: kIconsColor,
            //         ),
            //         SizedBox(
            //           width: width * 0.03,
            //         ),
            //         Text('О приложении',
            //             style: TextStyle(
            //               color: kIconsColor,
            //             )),
            //       ],
            //     )),
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
