import 'package:flutter/material.dart';
import '../components/novel_text.dart';

void getSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor,
        duration: const Duration(seconds: 1),
        padding: const EdgeInsets.all(20),
        content: CustomText(
          textColor: const Color(0xffF8FDFF),
          textName: title,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
}
