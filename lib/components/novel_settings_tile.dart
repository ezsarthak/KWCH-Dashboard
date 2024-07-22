import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'novel_text.dart';

class CustomSettingsTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final double? borderRadius;
  final double? titleSize, subtitleSize;
  final VoidCallback? onTap;
  const CustomSettingsTile(
      {Key? key,
      required this.title,
      this.subtitle,
      this.trailing,
      this.borderRadius,
      this.onTap,
      this.titleSize,
      this.subtitleSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BorderRadius border =
    //     BorderRadius.circular(borderRadius ?? Dimensions.smallCornerRadius);
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          ListTile(
            // tileColor: Theme.of(context).cardColor,

            visualDensity: VisualDensity.adaptivePlatformDensity,
            // minVerticalPadding: 2,
            enableFeedback: true,

            /// Shape

            /// Elements
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                trailing!,
                CustomText(
                  textName: title,
                  fontSize: titleSize ?? 16,
                  textColor: Theme.of(context).textTheme.titleMedium!.color,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            subtitle: subtitle != null
                ? CustomText(
                    textName: subtitle ?? '',
                    fontSize: subtitleSize ?? 13,
                    fontWeight: FontWeight.w400,
                    textColor: Theme.of(context).textTheme.titleSmall!.color,
                  )
                : null,
            trailing: Icon(
              Iconsax.arrow_right_3,
              size: 16,
              color: Theme.of(context).textTheme.labelLarge!.color,
            ),

            /// On Tap
            onTap: onTap ?? () {},
          ),
          Container(
            height: 1,
            color:
                Theme.of(context).textTheme.labelLarge!.color!.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}
