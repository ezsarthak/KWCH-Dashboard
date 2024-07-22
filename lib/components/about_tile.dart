// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'novel_text.dart';

class AboutTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String handle;
  final String profile;
  final String handleUrl;
  const AboutTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.handle,
      required this.handleUrl,
      required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 32,
            foregroundImage: NetworkImage(profile),
          ),
          title: CustomText(
            textName: title,
            fontWeight: FontWeight.w600,
            textColor: Theme.of(context).textTheme.labelLarge!.color,
            fontSize: 20,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CustomText(
              textName: subTitle,
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
          padding: const EdgeInsets.only(left: 16.0),
          child: ListTile(
            onTap: () async {
              final url = handleUrl;
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
            title: CustomText(
              textName: handle,
              letterSpacing: 2,
              textColor: Theme.of(context).indicatorColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
