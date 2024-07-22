// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/dimensions.dart';
import '../components/about_tile.dart';
import '../components/novel_text.dart';
import '../constants/novel_colors.dart';
import '../setup/app_details.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        textName: 'About',
                        fontSize: Dimensions.appBarTitle,
                        textColor:
                            Theme.of(context).textTheme.labelLarge!.color,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomText(
                        textName: "Know More About US",
                        fontWeight: FontWeight.w200,
                        fontSize: Dimensions.appBarSubTitle,
                        textColor:
                            Theme.of(context).textTheme.labelLarge!.color,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  // const AboutTile(
                  //   title: "Team Shadow",
                  //   subTitle: "Unleash your creativity on your screen 📱🔥",
                  //   handle: "Play Store",
                  //   profile:
                  //       "https://gitlab.com/SarthakDesigns/moreappsraw/-/raw/main/tyhjhtgzrwe.jpg",
                  //   handleUrl:
                  //       "https://play.google.com/store/apps/dev?id=5668598285863173548",
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),

                  const AboutTile(
                      title: creditName,
                      subTitle: creditDescription,
                      handle: creditHandle,
                      handleUrl: creditHandleUrl,
                      profile: creditUrl),

                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        color: Colors.white.withOpacity(0.3)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    textName: "Dashboard",
                    fontWeight: FontWeight.w400,
                    textColor: Theme.of(context).textTheme.labelLarge!.color,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 32,
                          foregroundImage:
                              NetworkImage("https://i.imgur.com/oHQRX2B.jpg"),
                        ),
                        title: CustomText(
                          textName: "Sarthak Patil",
                          fontWeight: FontWeight.w600,
                          textColor:
                              Theme.of(context).textTheme.labelLarge!.color,
                          fontSize: 20,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CustomText(
                            textName: "App Dev And Designer",
                            letterSpacing: 2,
                            textColor: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .color!
                                .withOpacity(0.7),
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                const url = "https://t.me/ezsarthak";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                }
                              },
                              child: CustomText(
                                textName: "Telegram",
                                letterSpacing: 2,
                                textColor: Theme.of(context).indicatorColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            GestureDetector(
                              onTap: () async {
                                const url = "https://www.instagram.com/sarthak_designs";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                }
                              },
                              child: CustomText(
                                textName: "Instagram",
                                letterSpacing: 2,
                                textColor: Theme.of(context).indicatorColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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

//  ListView(
//             physics: const BouncingScrollPhysics(),
//             scrollDirection: Axis.vertical,
//             shrinkWrap: true,
//             clipBehavior: Clip.none,
//             padding: const EdgeInsets.only(left: 18, right: 18),
//             children: [
//               Entry.all(
//                 delay: const Duration(milliseconds: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.transparent,
//                       backgroundImage: CachedNetworkImageProvider(url),
//                       radius: MediaQuery.of(context).size.width * 0.2,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomText(
//                           textName: "Sarthak Designs",
//                           fontSize: 18,
//                           textColor: Theme.of(context)
//                               .textTheme
//                               .labelLarge!
//                               .color,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         CustomText(
//                           textName: "Wallpapers Designer",
//                           fontSize: 15,
//                           textColor: Theme.of(context)
//                               .textTheme
//                               .labelMedium!
//                               .color,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               SettingsPanel(panelName: "Social Accounts", items: [
//                 CustomSettingsTile(
//                     title: "Twitter",
//                     trailing: CustomButton(
//                       backgroundColor: Colors.transparent,
//                       // padding: const EdgeInsets.all(10),
//                       buttonContent: Icon(
//                         Iconsax.send_2,
//                         size: 32,
//                         color: Theme.of(context)
//                             .primaryColor
//                             .withOpacity(0.7),
//                       ),
//                     ),
//                     onTap: () async {
//                       const url = "https://twitter.com/SarthakDesigns";
//                       if (await canLaunch(url)) {
//                         await launch(url);
//                       }
//                     }),
//                 const SizedBox(
//                   height: 12,
//                 ),
//                 CustomSettingsTile(
//                   title: "Telegram",
//                   trailing: CustomButton(
//                     backgroundColor: Colors.transparent,
//                     // padding: const EdgeInsets.all(10),
//                     buttonContent: Icon(
//                       Iconsax.send_2,
//                       size: 32,s
//                       color:
//                           Theme.of(context).primaryColor.withOpacity(0.7),
//                     ),
//                   ),
//                   onTap: () async {
//                     const url = "https://t.me/Wallery_Walls";
//                     if (await canLaunch(url)) {
//                       await launch(url);
//                     }
//                   },
//                 ),
//                 const SizedBox(
//                   height: 12,
//                 ),
//                 CustomSettingsTile(
//                     title: "Instagram",
//                     trailing: CustomButton(
//                       backgroundColor: Colors.transparent,
//                       // padding: const EdgeInsets.all(10),
//                       buttonContent: Icon(
//                         Iconsax.send_2,
//                         size: 32,
//                         color: Theme.of(context)
//                             .primaryColor
//                             .withOpacity(0.7),
//                       ),
//                     ),
//                     onTap: () async {
//                       const url =
//                           "https://www.instagram.com/sarthak_designs";
//                       if (await canLaunch(url)) {
//                         await launch(url);
//                       }
//                     }),
//               ])
//             ],
//           ),
