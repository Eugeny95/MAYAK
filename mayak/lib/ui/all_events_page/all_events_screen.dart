import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mayak/buisiness/all_events_page_bloc/all_events_bloc/all_events_bloc.dart';
import 'package:mayak/buisiness/all_events_page_bloc/select_category_bloc/bloc/select_category_bloc.dart';

import 'package:mayak/ui/constants.dart';
import 'package:mayak/ui/all_events_page/components/carousel.dart';
import 'package:mayak/ui/all_events_page/components/event_card.dart';

import 'package:visibility_detector/visibility_detector.dart';

class AllEventsPage extends StatefulWidget {
  const AllEventsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AllEventsPageState();
  }
}

class _AllEventsPageState extends State<AllEventsPage> {
  List<GlobalKey> globalKeys = [];
  bool lock = false;

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  Widget generateItems(AllEventsState state) {
    globalKeys.clear();
    return ListView.builder(
        shrinkWrap: true,
        itemCount: state.allEventsHttpModel!.all_events!.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          GlobalKey globalKey = GlobalKey();

          globalKeys.add(globalKey);
          if (state.allEventsHttpModel!.all_events![i].events!.isEmpty) {
            return const Column();
          }
          return VisibilityDetector(
            key: Key(i.toString()),
            onVisibilityChanged: (info) async {
              if (!lock) {
                BlocProvider.of<SelectCategoryBloc>(context).add(
                    SelectCategoryIndexEvent(
                        selectedIndex:
                            int.parse(info.key.toString().split("'")[1])));
              }
              await Future.delayed(const Duration(seconds: 3)).then((value) {
                lock = false;
              });
            },
            child: AllEventsCategoryItem(
              key: globalKey,
              title: state.allEventsHttpModel!.all_events![i].name_category!,
              events: List.generate(
                  state.allEventsHttpModel!.all_events![i].events!.length,
                  (index) => EventCard(
                        eventHttpModel: state
                            .allEventsHttpModel!.all_events![i].events![index],
                      )),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(0, 62, 62, 62),
        child: CustomScrollView(
          physics: const ScrollPhysics(),
          controller: scrollController,
          slivers: <Widget>[
            SliverAppBar(
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: height / 3.0,
                // backgroundColor: Colors.transparent,
                flexibleSpace: Stack(children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 116, 116, 116),
                        borderRadius: BorderRadius.only()),
                    child: const Cerousel(),
                  ),
                ])),
            SliverAppBar(
              // backgroundColor: Colors.transparent,
              toolbarHeight: 12,
              pinned: true,
              snap: false,
              floating: false,
              flexibleSpace: Container(
                color: kContentColorLightTheme,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    BlocBuilder<AllEventsBloc, AllEventsState>(
                      builder: (context, state) {
                        if (state.allEventsStatus == AllEventsStatus.done) {
                          return BlocBuilder<SelectCategoryBloc,
                                  SelectCategoryState>(
                              builder: (context, stateCategory) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: state
                                    .allEventsHttpModel!.all_events!.length,
                                itemBuilder: (context, index) {
                                  if (state
                                      .allEventsHttpModel!
                                      .all_events![index]!
                                      .events!
                                      .isEmpty) return Column();
                                  return Container(
                                    margin: const EdgeInsets.only(
                                        left: 7, bottom: 7),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: (index ==
                                                stateCategory.selectedIndex)
                                            ? Color.fromARGB(255, 236, 234, 214)
                                            : kPrimaryColor.withOpacity(0.6),
                                        minimumSize:
                                            Size(height * 0.12, width * 0.25),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12), // <-- Radius
                                        ),
                                      ),
                                      onPressed: () {
                                        lock = true;
                                        BlocProvider.of<SelectCategoryBloc>(
                                                context)
                                            .add(SelectCategoryIndexEvent(
                                                selectedIndex: index));
                                        Scrollable.ensureVisible(
                                            globalKeys[index].currentContext!,
                                            duration: const Duration(
                                                milliseconds: 0));
                                      },
                                      child: Text(
                                          state.allEventsHttpModel!
                                              .all_events![index].name_category
                                              .toString(),
                                          style: const TextStyle(
                                              // fontFamily: 'Moniqa',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  228, 218, 58, 47))),
                                    ),
                                  );
                                });
                          });
                        } else {
                          return const Column();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BlocBuilder<AllEventsBloc, AllEventsState>(
                    builder: (context, state) {
                      return (state.allEventsStatus == AllEventsStatus.done)
                          ? generateItems(state)
                          : const Center(child: CircularProgressIndicator());
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return NewEventDialog();
          //   },
          // );
        },
      ),
    );
  }
}
