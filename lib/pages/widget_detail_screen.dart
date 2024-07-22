// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../components/novel_button.dart';
import '../components/novel_text.dart';
import '../constants/novel_colors.dart';
import '../models/widget_info_model.dart';
import '../utils/extensions.dart';
import '../constants/dimensions.dart';

class WidgetDetails extends StatelessWidget {
  final String imagepath;
  final AsyncSnapshot<List<WidgetInfo>> snapshot;

  const WidgetDetails(
      {super.key, required this.snapshot, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    Widget infoTile(String title, String? content) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomText(
                textName: title.capitalizeFirstOfEach,
                fontSize: 20,
                softWrap: true,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w600,
                textColor: Theme.of(context).textTheme.labelLarge!.color,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: CustomText(
                  textName: content?.capitalizeFirstOfEach ?? "unavailable",
                  softWrap: true,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  textColor: Theme.of(context).textTheme.labelLarge!.color,
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: 1000,
                ),
              ),
            ),
          ],
        ),
      );
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
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 22, left: 22),
                    child: CustomText(
                      textName:
                          snapshot.data!.elementAt(0).title ?? "unavailable",
                      fontSize: Dimensions.appBarTitle,
                      textColor: Theme.of(context).textTheme.labelLarge!.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 22, left: 22),
                    child: CustomText(
                      textName:
                          "Desingned By ${snapshot.data?.elementAt(0).author}" ??
                              "unavailable",
                      textOverflow: TextOverflow.ellipsis,
                      softWrap: true,
                      fontWeight: FontWeight.w200,
                      fontSize: Dimensions.appBarSubTitle,
                      textColor: Theme.of(context).textTheme.labelLarge!.color,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.3,
                            foregroundImage: FileImage(File(imagepath))),
                        Container(
                          height: MediaQuery.of(context).size.width * 0.7,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(360),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width * 0.85,
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.23),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(360),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width * 1,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.23),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(360),
                          ),
                        ),
                      ],
                    ),
                    // child: Container(
                    //   height: MediaQuery.of(context).size.width * 0.7,
                    //   width: MediaQuery.of(context).size.width * 0.7,
                    //   margin: const EdgeInsets.symmetric(vertical: 8),
                    //   decoration: BoxDecoration(
                    //       color: Colors.red,
                    //       borderRadius: BorderRadius.circular(360)),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       // color: Colors.red,
                    //       image: DecorationImage(
                    //           fit: BoxFit.cover,
                    //           image: FileImage(File(imagepath))),
                    //     ),
                    //   ),
                    // ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 22, left: 22),
                    child: infoTile("Name:", snapshot.data!.elementAt(0).title),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 22, left: 22),
                    child:
                        infoTile("Author:", snapshot.data!.elementAt(0).author),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 22, left: 22),
                    child: infoTile("Version:",
                        snapshot.data!.elementAt(0).version.toString()),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: CustomButton(
                      onPressed: () {
                        applyDialog(context);
                      },
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.16,
                          vertical: MediaQuery.of(context).size.width * 0.04),
                      backgroundColor: Theme.of(context).indicatorColor,
                      // padding: const EdgeInsets.all(10),
                      buttonContent: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Iconsax.brush_45,
                            size: 28,
                            color:
                                Theme.of(context).textTheme.titleLarge!.color,
                          ),
                          CustomText(
                            textName: "Apply",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            textColor:
                                Theme.of(context).textTheme.titleLarge!.color,
                          )
                        ],
                      ),
                    ),
                  ),
                  // CustomText(
                  //   textName: "Description:",
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.w600,
                  //   textColor: Theme.of(context).textTheme.labelLarge!.color,
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // CustomText(
                  //   textName: snapshot.data!.elementAt(0).description ??
                  //       "unavailable",
                  //   softWrap: true,
                  //   textOverflow: TextOverflow.ellipsis,
                  //   fontSize: 16,
                  //   fontWeight: FontWeight.w400,
                  //   textColor: Theme.of(context).textTheme.labelLarge!.color,
                  //   maxLines: 10000,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void applyDialog(BuildContext context) {
    var dialog = AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      title: CustomText(
        textName: "Steps to Apply",
        fontSize: 20,
        textColor: Theme.of(context).textTheme.labelLarge!.color,
        fontWeight: FontWeight.bold,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText(
                fontWeight: FontWeight.w500,
                maxLines: 100,
                lineHeight: 1.6,
                textColor: Theme.of(context).textTheme.labelMedium!.color,
                textName:
                    "1.Install KWCH app in android Phone (Requires Paid- in app purchase) and Wear OS Smart Watch (Free) both \n "
                        "2.Connect Smartwatch with Phone. Open this watchface in KWCH app of Android Phone \n "
                        "3.Apply KWCH watchface on the watch\n "
                        "4. In the phone, select one watchface from KWCH app. Click on the Green watch icon on the top Apply and done \n "
                        "5. Ok to Continue"

                        ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Container(
                        height: 50,
                        width: 108,
                        decoration: BoxDecoration(
                            color: Theme.of(context).textTheme.titleMedium!.color,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: CustomText(
                            textName: "Cancel",
                            textColor:
                            Theme.of(context).textTheme.titleLarge!.color,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await LaunchApp.openApp(
                          androidPackageName: 'org.kustom.watchface',
                          openStore: false,
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 108,
                        decoration: BoxDecoration(
                            color: Theme.of(context).textTheme.titleMedium!.color,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: CustomText(
                            textName: "OK",
                            textColor:
                                Theme.of(context).textTheme.titleLarge!.color,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
