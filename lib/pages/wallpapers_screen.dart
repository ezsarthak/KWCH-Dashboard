// ignore_for_file: deprecated_member_use

import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../constants/dimensions.dart';
import '../components/loading_widget.dart';
import '../components/novel_text.dart';
import '../components/wall_card.dart';
import '../constants/novel_colors.dart';
import '../models/wall_model.dart';
import '../services/load_wall.dart';

class Wallpapers extends StatefulWidget {
  const Wallpapers({
    Key? key,
  }) : super(key: key);

  @override
  State<Wallpapers> createState() => _WallpapersState();
}

class _WallpapersState extends State<Wallpapers> {
  late Future<List<WallModel>> wallObject;

  @override
  void initState() {
    wallObject = WallApi.getPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
            child: FutureBuilder<List<WallModel>>(
                future: wallObject.whenComplete(
                    () => Future.delayed(const Duration(milliseconds: 200))),
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            textName: "WallPapers",
                            fontSize: Dimensions.appBarTitle,
                            textColor:
                                Theme.of(context).textTheme.labelLarge!.color,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomText(
                            textName: "Explore Featured Freebies",
                            fontWeight: FontWeight.w200,
                            fontSize: Dimensions.appBarSubTitle,
                            textColor:
                                Theme.of(context).textTheme.labelLarge!.color,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          StaggeredGridView.countBuilder(
                              itemCount: snapshot.data!.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              addRepaintBoundaries: true,
                              staggeredTileBuilder: (index) =>
                                  const StaggeredTile.count(2, 3),
                              crossAxisCount: 4,
                              itemBuilder: (context, index) {
                                return Entry.all(
                                  delay: const Duration(milliseconds: 100),
                                  child: WallCard(
                                    index: index,
                                    currentWall:
                                        snapshot.data!.elementAt(index),
                                  ),
                                );
                              }),
                        ],
                      ),
                    );
                  } else {
                    return const LoadingWidget();
                  }
                }),
          ),
        ),
      ),
    );
  }
}
