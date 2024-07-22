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
            child: Container(
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(360),
                  image: DecorationImage(
                      image: FileImage(File(widget.imagepath)))),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
