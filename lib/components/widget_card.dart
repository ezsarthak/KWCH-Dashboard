import 'dart:io';
import 'package:flutter/material.dart';
import '../models/widget_info_model.dart';
import '../pages/widget_detail_screen.dart';
import '../services/load_widget_detail.dart';

class WidgetCard extends StatefulWidget {
  final String imagepath;
  final String jsonpath;

  const WidgetCard({Key? key, required this.imagepath, required this.jsonpath})
      : super(key: key);

  @override
  State<WidgetCard> createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard> {
  late Future<List<WidgetInfo>> widgetobject;

  @override
  void initState() {
    widgetobject = LoadWidgetDetail.getwidgetinfo(widget.jsonpath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WidgetInfo>>(
      future: widgetobject.whenComplete(
          () => Future.delayed(const Duration(milliseconds: 100))),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => WidgetDetails(
                            snapshot: snapshot,
                            imagepath: widget.imagepath,
                          ))));
            },
            child: Stack(
              children: [
                SizedBox(
                  width:  MediaQuery.of(context).size.width * 0.64,
                  height: MediaQuery.of(context).size.width * 0.64,
                  child: Container(
                    margin: const EdgeInsets.only(top: 18, left: 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        image:  DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File(widget.imagepath)))),

                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(360),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/app elements/watch.png"))
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
