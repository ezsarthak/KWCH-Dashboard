import 'package:flutter/material.dart';
import 'novel_text.dart';

class SettingsPanel extends StatelessWidget {
  final String panelName;
  final double? paddingBottom;
  final List<Widget> items;
  const SettingsPanel(
      {Key? key,
      required this.panelName,
      required this.items,
      this.paddingBottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          textName: panelName,
          fontSize: 20,
          textColor: Theme.of(context).textTheme.labelLarge!.color,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
