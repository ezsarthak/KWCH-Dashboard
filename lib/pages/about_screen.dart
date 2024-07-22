// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../constants/dimensions.dart';
import '../components/about_tile.dart';
import '../components/novel_text.dart';
import '../constants/novel_colors.dart';

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
                  const AboutTile(
                    title: "Team Shadow",
                    subTitle: "Unleash your creativity on your screen 📱🔥",
                    handle: "Play Store",
                    profile:
                        "https://gitlab.com/SarthakDesigns/moreappsraw/-/raw/main/tyhjhtgzrwe.jpg",
                    handleUrl:
                        "https://play.google.com/store/apps/dev?id=5668598285863173548",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const AboutTile(
                      title: "Sarthak Patil",
                      subTitle: "App Dev And Designer",
                      handle: "Telegram",
                      handleUrl: "https://t.me/im_dope",
                      profile: "https://i.imgur.com/oHQRX2B.jpg"),
                  const SizedBox(
                    height: 20,
                  ),
                  const AboutTile(
                      title: "Piyush KPV",
                      subTitle: "UI UX Designer",
                      handle: "Instagram",
                      handleUrl: "https://www.instagram.com/kpv.piyush",
                      profile: "https://i.imgur.com/qacy6VQ.png"),
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