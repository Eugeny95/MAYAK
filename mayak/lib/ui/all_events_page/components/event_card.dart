import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:data_layer/models/http_models/event_http_model.dart';
import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.all(5),
              crossAxisSpacing: 1,
              mainAxisSpacing: 3,
              childAspectRatio: 0.76,
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
            width: width / 2.3,
            height: height / 3.6,
            padding: const EdgeInsets.only(top: 4.0),
            margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              border:
                  Border.all(width: 2, color: Color.fromARGB(74, 88, 88, 88)),
              borderRadius: BorderRadius.circular(15.0),
              color: Color.fromARGB(221, 236, 234, 214),
            ),
            child: Column(children: [
              Container(
                width: width / 2.4,
                height: height / 7.6,
                // padding: const EdgeInsets.all(2), // Border width
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(15.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
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
                height: height * 0.005,
              ),
              SizedBox(
                height: height / 17,
                width: width * 0.41,
                child: Text(
                  eventHttpModel.name_event!,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    height: 0.97,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
                child: Row(children: [
                  SizedBox(
                      height: height / 17,
                      width: width * 0.41,
                      child: Text(
                        eventHttpModel.plece_event!,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          height: 0.97,
                        ),
                      )),
                  SizedBox(
                    width: width / 40,
                  ),
                  SizedBox(
                      height: height / 17,
                      width: width * 0.41,
                      child: Text(
                        eventHttpModel.time_event!,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          height: 0.97,
                        ),
                      )),
                ]),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              SizedBox(
                  height: height / 17,
                  width: width * 0.41,
                  child: Text(
                    eventHttpModel.price.toString(),
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      height: 0.97,
                    ),
                  )),
              Container(
                width: width / 2.5,
                height: height / 22,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Color.fromARGB(108, 88, 88, 88)),
                  color: Color.fromARGB(255, 243, 243, 243),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ]),
          ),
        ]));
  }
}
