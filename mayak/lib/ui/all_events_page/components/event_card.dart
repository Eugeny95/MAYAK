import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:data_layer/models/http_models/event_http_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AllEventsCategoryItem extends StatelessWidget {
  const AllEventsCategoryItem({
    Key? key,
    required this.title,
    required this.events,
  }) : super(key: key);

  final String title;
  final List events;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 15),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              // fontFamily: 'Moniqa',
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GridView.count(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(5),
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 1.6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 1,
              children: [...events],
            ))
        // Center(
        //   child: GridView(
        //     gridDelegate:
        //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        //     children: [...items],
        //     padding: const EdgeInsets.all(5),
        //     shrinkWrap: true,
        //     physics: const NeverScrollableScrollPhysics(),
        //   ),
        // )
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  final EventHttpModel eventHttpModel;
  const EventCard({Key? key, required this.eventHttpModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //  BlocProvider.of<BasketBloc>(context);
    return GestureDetector(
        onTap: () {
          // Открытие диалога события!!!!!!
          // AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
          // showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return BlocProvider<AuthBloc>.value(
          //           value: authBloc, //

          //           child: SelectEventDialog(
          //             eventHttpModel: eventHttpModel,
          //           ));
          //     });
        },
        child: Stack(children: [
          Container(
            width: width * 0.6,
            height: height / 3.6,
            padding: const EdgeInsets.only(top: 4.0),
            margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.transparent),
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.transparent),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: width * 0.7,
                height: height * 0.15,
                // padding: const EdgeInsets.all(2), // Border width
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: SizedBox.fromSize(
                    // size:  Size.fromRadius(70), // Image radius
                    child: CachedNetworkImage(
                        cacheKey: (eventHttpModel.image!.isEmpty)
                            ? ''
                            : eventHttpModel.image!,
                        useOldImageOnUrlChange: true,
                        fadeInDuration: Duration(milliseconds: 500),
                        fadeOutDuration: Duration(milliseconds: 0),
                        filterQuality: FilterQuality.low,
                        imageUrl:
                            //    'https://art-lunch.ru/content/uploads/2018/07/Greek_salad_01.jpg',
                            (eventHttpModel.image!.isEmpty)
                                ? ''
                                : eventHttpModel.image!,
                        placeholder: (context, url) => Container(
                            width: 50,
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                  'Изображение загружается',
                                  textAlign: TextAlign.center,
                                )),
                                CircularProgressIndicator.adaptive(),
                              ],
                            )),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.02,
                    child: Text(
                      eventHttpModel.name_event!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 0.97,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.012,
                child: Row(children: [
                  // SizedBox(
                  //     height: height / 17,
                  //     width: width * 0.41,
                  //     child: Text(
                  //       eventHttpModel.plece_event!,
                  //       textDirection: TextDirection.ltr,
                  //       textAlign: TextAlign.center,
                  //       style: const TextStyle(
                  //         fontSize: 13,
                  //         fontWeight: FontWeight.normal,
                  //         height: 0.97,
                  //       ),
                  //     )),

                  Text(
                    DateFormat("dd.MM.yyyy hh:mm")
                        .format(eventHttpModel.time_event!),
                    // DateFormat('dd.MM.yyyy')
                    //     .format(eventHttpModel.time_event as DateTime),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      height: 0.97,
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              SizedBox(
                  height: height / 17,
                  width: width * 0.41,
                  child: Text(
                    '${eventHttpModel.price.toString()} руб  ',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      height: 0.97,
                    ),
                  )),
            ]),
          ),
        ]));
  }
}
