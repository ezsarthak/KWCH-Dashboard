// ignore_for_file: deprecated_member_use, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:iconsax/iconsax.dart';
import '../constants/novel_colors.dart';
import '../setup/app_details.dart';
import '../components/novel_settings_tile.dart';
import '../components/settings_panel.dart';
import '../components/snackbar.dart';
import '../constants/dimensions.dart';
import 'about_screen.dart';

import 'package:url_launcher/url_launcher.dart';
import '../components/novel_button.dart';
import '../components/novel_text.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: Dimensions.pagePadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        textName: "Settings",
                        fontSize: Dimensions.appBarTitle,
                        textColor:
                            Theme.of(context).textTheme.labelLarge!.color,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomText(
                        textName: "Change Preferences of App",
                        fontWeight: FontWeight.w200,
                        fontSize: Dimensions.appBarSubTitle,
                        maxLines: 1,
                        textColor:
                            Theme.of(context).textTheme.labelLarge!.color,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        clipBehavior: Clip.none,
                        children: [
                          // SettingsPanel(panelName: 'UI', items: [
                          //   Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       CustomButton(
                          //           borderRadius: Dimensions.smallCornerRadius,
                          //           padding: EdgeInsets.symmetric(
                          //               horizontal:
                          //                   MediaQuery.of(context).size.width *
                          //                       0.1,
                          //               vertical: 20),
                          //           backgroundColor: providerChange.darkTheme
                          //               ? Theme.of(context).cardColor
                          //               : Theme.of(context).indicatorColor,
                          //           onPressed: () {
                          //             providerChange.darkTheme = false;
                          //           },
                          //           buttonContent: CustomText(
                          //             textName: "Light",
                          //             fontWeight: FontWeight.w700,
                          //             textColor: Theme.of(context).hintColor,
                          //             fontSize: 20,
                          //           )),
                          //       CustomButton(
                          //           borderRadius: Dimensions.smallCornerRadius,
                          //           padding: EdgeInsets.symmetric(
                          //               horizontal:
                          //                   MediaQuery.of(context).size.width *
                          //                       0.1,
                          //               vertical: 20),
                          //           backgroundColor: providerChange.darkTheme
                          //               ? Theme.of(context).indicatorColor
                          //               : Theme.of(context).cardColor,
                          //           onPressed: () {
                          //             providerChange.darkTheme = true;
                          //           },
                          //           buttonContent: CustomText(
                          //             fontSize: 20,
                          //             fontWeight: FontWeight.w700,
                          //             textColor: Theme.of(context)
                          //                 .textTheme
                          //                 .labelLarge!
                          //                 .color,
                          //             textName: "Dark",
                          //           ))
                          //     ],
                          //   )
                          // ]),
                          // SettingsPanel(
                          //     panelName: 'Preview Background',
                          //     items: [
                          //       Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: [
                          //           CustomButton(
                          //               borderRadius:
                          //                   Dimensions.smallCornerRadius,
                          //               padding: EdgeInsets.symmetric(
                          //                   horizontal: MediaQuery.of(context)
                          //                           .size
                          //                           .width *
                          //                       0.1,
                          //                   vertical: 20),
                          //               backgroundColor: providerChange.bg
                          //                   ? Theme.of(context).cardColor
                          //                   : Theme.of(context).indicatorColor,
                          //               onPressed: () {
                          //                 setState(() {
                          //                   providerChange.widgetbg = false;
                          //                 });

                          //                 // themeChange.darkTheme = false;
                          //               },
                          //               buttonContent: CustomText(
                          //                 textName: "Black",
                          //                 fontWeight: FontWeight.w700,
                          //                 textColor: providerChange.bg == false
                          //                     ? Theme.of(context).hintColor
                          //                     : Theme.of(context)
                          //                         .textTheme
                          //                         .labelLarge!
                          //                         .color,
                          //                 fontSize: 20,
                          //               )),
                          //           CustomButton(
                          //               borderRadius:
                          //                   Dimensions.smallCornerRadius,
                          //               padding: EdgeInsets.symmetric(
                          //                   horizontal: MediaQuery.of(context)
                          //                           .size
                          //                           .width *
                          //                       0.1,
                          //                   vertical: 20),
                          //               backgroundColor: providerChange.bg
                          //                   ? Theme.of(context).indicatorColor
                          //                   : Theme.of(context).cardColor,
                          //               onPressed: () {
                          //                 setState(() {
                          //                   providerChange.widgetbg = true;
                          //                 });
                          //               },
                          //               buttonContent: CustomText(
                          //                 fontSize: 20,
                          //                 textColor: providerChange.bg == true
                          //                     ? Theme.of(context).hintColor
                          //                     : Theme.of(context)
                          //                         .textTheme
                          //                         .labelLarge!
                          //                         .color,
                          //                 textName: "Grey",
                          //                 fontWeight: FontWeight.w700,
                          //               ))
                          //         ],
                          //       )
                          //     ]),
                          SettingsPanel(
                            panelName: 'General',
                            items: [
                              CustomSettingsTile(
                                title: 'About Us',
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const AboutScreen()))),
                                trailing: CustomButton(
                                  backgroundColor: Colors.transparent,
                                  // padding: const EdgeInsets.all(10),
                                  buttonContent: Icon(
                                    Iconsax.send_2,
                                    size: 24,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.7),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CustomSettingsTile(
                                title: 'Clear Cache',
                                trailing: CustomButton(
                                  backgroundColor: Colors.transparent,
                                  // padding: const EdgeInsets.all(10),
                                  buttonContent: Icon(
                                    Iconsax.trash,
                                    size: 24,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.7),
                                  ),
                                ),
                                onTap: () {
                                  DefaultCacheManager().emptyCache();
                                  imageCache.clear();
                                  imageCache.clearLiveImages();

                                  getSnackBar(context, "Cache Cleared");
                                },
                              ),
                            ],
                          ),

                          SettingsPanel(panelName: "Feedback", items: [
                            CustomSettingsTile(
                              title: "Rate App",
                              trailing: CustomButton(
                                backgroundColor: Colors.transparent,
                                // padding: const EdgeInsets.all(10),
                                buttonContent: Icon(
                                  Iconsax.like,
                                  size: 24,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.7),
                                ),
                              ),
                              onTap: () async {
                                String uri = appLink;
                                if (await canLaunch(uri)) {
                                  await launch(uri);
                                } else {
                                  getSnackBar(context, "No Browser found");
                                  print("No Browser found");
                                }
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomSettingsTile(
                              title: "Report Bug",
                              trailing: CustomButton(
                                backgroundColor: Colors.transparent,
                                // padding: const EdgeInsets.all(10),
                                buttonContent: Icon(
                                  Iconsax.danger,
                                  size: 24,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.7),
                                ),
                              ),
                              onTap: () async {
                                const String subject =
                                    "Report Bug For $appName";
                                const String stringText =
                                    "Enter Details Of Bug Here And Send";
                                String uri =
                                    'mailto:$emailID?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(stringText)}';
                                if (await canLaunch(uri)) {
                                  await launch(uri);
                                } else {
                                  getSnackBar(context, "No email client found");
                                  print("No email client found");
                                }
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomSettingsTile(
                              title: "Give Suggestions",
                              trailing: CustomButton(
                                backgroundColor: Colors.transparent,
                                // padding: const EdgeInsets.all(10),
                                buttonContent: Icon(
                                  Iconsax.add_square,
                                  size: 24,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.7),
                                ),
                              ),
                              onTap: () async {
                                const String subject =
                                    "Suggestions For $appName";
                                const String stringText =
                                    "Enter Details Of Your Suggestions, Feel Free To Send";
                                String uri =
                                    'mailto:$emailID?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(stringText)}';
                                if (await canLaunch(uri)) {
                                  await launch(uri);
                                } else {
                                  getSnackBar(context, "No email client found");
                                  print("No email client found");
                                }
                              },
                            ),
                          ]),
                          SettingsPanel(
                              panelName: "Others",
                              paddingBottom: 12,
                              items: [
                                CustomSettingsTile(
                                  title: "Disclaimer",
                                  trailing: CustomButton(
                                    backgroundColor: Colors.transparent,
                                    // padding: const EdgeInsets.all(10),
                                    buttonContent: Icon(
                                      Iconsax.warning_2,
                                      size: 24,
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.7),
                                    ),
                                  ),
                                  onTap: () {
                                    disclaimerDialog(context);
                                  },
                                ),
                                // const SizedBox(
                                //   height: 16,
                                // ),
                                // CustomSettingsTile(
                                //   title: "Log Out",
                                //   trailing: CustomButton(
                                //     backgroundColor: Colors.transparent,
                                //     // padding: const EdgeInsets.all(10),
                                //     buttonContent: Icon(
                                //       Iconsax.logout,
                                //       size: 24,
                                //       color: Theme.of(context)
                                //           .primaryColor
                                //           .withOpacity(0.7),
                                //     ),
                                //   ),
                                //   onTap: () {
                                //     final provider = Provider.of<MyAppProvider>(
                                //         context,
                                //         listen: false);
                                //     provider.logOut();
                                //     Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 const SplashScreen()));
                                //   },
                                // )
                              ]),
                          // const SizedBox(
                          //   height: 6,
                          // ),
                          // Container(
                          //   height: 1,
                          //   margin: const EdgeInsets.only(bottom: 24),
                          //   width: MediaQuery.of(context).size.width * 0.8,
                          //   decoration: BoxDecoration(
                          //       color:
                          //           Theme.of(context).textTheme.labelMedium!.color),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: ListTile(
                    title: Row(children: [
                      CustomButton(
                          backgroundColor: Theme.of(context).indicatorColor,
                          borderRadius: 14,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                          buttonContent: CustomText(
                            textName: "Information",
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            textColor:
                                Theme.of(context).textTheme.titleLarge!.color,
                          )),
                      const SizedBox(
                        width: 12,
                      ),
                      CustomText(
                        textName: "V 1.0.0",
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        softWrap: true,
                        textColor:
                            Theme.of(context).textTheme.titleMedium?.color,
                      ),
                    ]),
                    trailing: CustomText(
                      maxLines: 1,
                      fontWeight: FontWeight.w500,
                      textName: "Made By Sarthak Patil",
                      fontSize: 8,
                      textOverflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textColor: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.color!
                          .withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void disclaimerDialog(BuildContext context) {
    var dialog = AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      title: CustomText(
        textName: "Disclaimer",
        fontSize: 20,
        textColor: Theme.of(context).textTheme.labelLarge!.color,
        fontWeight: FontWeight.bold,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText(
                fontWeight: FontWeight.w500,
                maxLines: 10,
                lineHeight: 1.6,
                textColor: Theme.of(context).textTheme.labelMedium!.color,
                textName:
                    "Watch Faces Are For Personal Use Only. For Commercial Give Us Proper Credit. Sharing Of This Widgets Not Allowed"),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Container(
                    height: 50,
                    width: 140,
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
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
