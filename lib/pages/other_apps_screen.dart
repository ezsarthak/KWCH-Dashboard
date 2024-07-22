// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../constants/dimensions.dart';
import '../constants/novel_colors.dart';
import '../models/apps_model.dart';
import '../services/load_apps.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/loading_widget.dart';
import '../components/novel_text.dart';

class OtherApps extends StatefulWidget {
  final AsyncSnapshot<List<String>> snapshot;
  const OtherApps({Key? key, required this.snapshot}) : super(key: key);

  @override
  State<OtherApps> createState() => _OtherAppsState();
}

class _OtherAppsState extends State<OtherApps> {
  late Future<List<AppsModel>> wallObject;

  @override
  void initState() {
    wallObject = AppApi.getApps();
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
          child: FutureBuilder<List<AppsModel>>(
              future: wallObject.whenComplete(
                  () => Future.delayed(const Duration(milliseconds: 700))),
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
                          textName: "More Apps",
                          fontSize: Dimensions.appBarTitle,
                          textColor:
                              Theme.of(context).textTheme.labelLarge!.color,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomText(
                          textName: "Check Out Other Apps ",
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
                                const StaggeredTile.count(4, 2.5),
                            crossAxisCount: 4,
                            itemBuilder: (context, index) {
                              return Entry.all(
                                delay: const Duration(milliseconds: 100),
                                child: GestureDetector(
                                  onTap: () async {
                                    final url =
                                        snapshot.data!.elementAt(index).link;
                                    if (await canLaunch(url!)) {
                                      await launch(url);
                                    }
                                  },
                                  child: CachedNetworkImage(
                                    progressIndicatorBuilder:
                                        (context, url, progress) => Center(
                                      child: SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 5,
                                          value: progress.progress,
                                          color: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .color,
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Center(child: Icon(Icons.error)),
                                    imageUrl:
                                        snapshot.data!.elementAt(index).banner!,
                                    imageBuilder: (context, imageProvider) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 6),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
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
        )),
      ),
    );
  }
}
