import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mayak/ui/constants.dart';

final List<String> imgList = [
  'http://147.45.109.158:8881/image_mayak/image/home_1.jpg',
  'http://147.45.109.158:8881/image_mayak/image/home_2.jpg',
  'http://147.45.109.158:8881/image_mayak/image/home_3.jpg',
  'http://147.45.109.158:8881/image_mayak/image/home_4.jpg',
  'http://147.45.109.158:8881/image_mayak/image/home_5.jpg'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                      imageUrl: item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      // child: Text(
                      //   'No. ${imgList.indexOf(item)} image',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 20.0,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ),
                  ),
                ],
              )),
        ))
    .toList();

class Cerousel extends StatelessWidget {
  const Cerousel({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: kPrimaryColor.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 252, 241, 232),
        toolbarHeight: height * 0.07,

        title: Center(
          child: Container(
            height: height * 0.08,
            child: Text(
              'Наверное это МАЯК',
              style: TextStyle(color: Colors.black),
            ),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       fit: BoxFit.fitHeight, image: AssetImage('assets/PinBon2.png')),
            // ),
          ),
        ),

        // Text(
        //   '    mayak',
        //   style: TextStyle(
        //       fontFamily: 'SHAL',
        //       color: Colors.red,
        //       fontSize: 65,
        //       fontWeight: FontWeight.normal),
        // ),
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          height: height * 0.3,
          // aspectRatio: 16 / 9,
          scrollDirection: Axis.vertical,
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }
}
