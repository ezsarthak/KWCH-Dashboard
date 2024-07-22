// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print, deprecated_member_use

import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../components/novel_text.dart';
import '../components/widget_card.dart';
import '../constants/dimensions.dart';
import '../constants/novel_colors.dart';
import '../utils/novel_provider.dart';

class WidgetScreen extends StatefulWidget {
  final AsyncSnapshot<List<String>> snapshot;

  const WidgetScreen({Key? key, required this.snapshot}) : super(key: key);

  @override
  State<WidgetScreen> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  @override
  Widget build(BuildContext context) {
    final providerChange = Provider.of<MyAppProvider>(context);
    List<String> img = [];
    List<String> json = [];

    Future<List<String>> getList() async {
      widget.snapshot.data!.forEach((element) {
        if (element.endsWith('.jpg')) {
          img.add(element);
        }
        if (element.endsWith('.json')) {
          json.add(element);
          print(json);
        }
      });
      return img;
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.bg1,
            AppColors.bg2,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: Dimensions.pagePadding,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            textName: "Watch Faces",
                            fontSize: Dimensions.appBarTitle,
                            textColor:
                                Theme.of(context).textTheme.labelLarge!.color,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Center(
                            child: CustomText(
                              textName: "Explore Featured WatchFace",
                              fontWeight: FontWeight.w200,
                              fontSize: Dimensions.appBarSubTitle,
                              textColor:
                                  Theme.of(context).textTheme.labelLarge!.color,
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // setState(() {
                            //   if (providerChange.axis == 4) {
                            //     providerChange.axisCount = 2;
                            //     providerChange.mainaxisCount = 2;
                            //   } else {
                            //     providerChange.axisCount = 4;
                            //     providerChange.mainaxisCount = 4;
                            //   }
                            // });
                          },
                          child: Icon(
                            Iconsax.setting_5,
                            size: 24,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Center(
                    child: FutureBuilder<List<String>>(
                      future: getList().whenComplete(() =>
                          Future.delayed(const Duration(milliseconds: 50))),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: StaggeredGridView.countBuilder(
                                itemCount: img.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(),
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                addRepaintBoundaries: true,
                                staggeredTileBuilder: (index) =>
                                    StaggeredTile.count(providerChange.axis,
                                        providerChange.mainaxis.toDouble()),
                                crossAxisCount: 4,
                                itemBuilder: (context, index) {
                                  return Entry.all(
                                    delay: const Duration(milliseconds: 20),
                                    child: WidgetCard(
                                      imagepath: img.elementAt(index),
                                      jsonpath: json.elementAt(index),
                                    ),
                                  );
                                }),
                          );
                        } else {
                          return CircularProgressIndicator(
                            color: Theme.of(context).indicatorColor,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
