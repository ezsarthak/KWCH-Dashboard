// ignore_for_file: use_build_context_synchronously
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../components/novel_text.dart';
import '../components/snackbar.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

enum SetWallpaperAs { home, lock, both }

final _setAs = {
  SetWallpaperAs.home: WallpaperManager.HOME_SCREEN,
  SetWallpaperAs.lock: WallpaperManager.LOCK_SCREEN,
  SetWallpaperAs.both: WallpaperManager.BOTH_SCREEN,
};

Future<void> setWallpaper({
  required BuildContext context,
  required String imgUrl,
}) async {
  var actionSheet = CupertinoActionSheet(
    title: Center(
      child: CustomText(
        textName: 'Set as',
        textColor: Theme.of(context).textTheme.labelLarge!.color,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        letterSpacing: 3,
      ),
    ),
    actions: [
      CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop(SetWallpaperAs.home);
          },
          child: CustomText(
            textName: 'Home Screen',
            textColor: Theme.of(context).textTheme.labelLarge!.color,
            fontSize: 15,
          )),
      CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop(SetWallpaperAs.lock);
          },
          child: CustomText(
            textName: 'Lock Screen',
            textColor: Theme.of(context).textTheme.labelLarge!.color,
            fontSize: 15,
          )),
      CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop(SetWallpaperAs.both);
          },
          child: CustomText(
            textName: 'Both Screens',
            textColor: Theme.of(context).textTheme.labelLarge!.color,
            fontSize: 15,
          )),
    ],
    cancelButton: CupertinoActionSheetAction(
      child: CustomText(
        textName: 'Cancel',
        fontSize: 15,
        textColor: Theme.of(context).textTheme.labelLarge!.color,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );

  var option = await showCupertinoModalPopup(
      barrierColor: Colors.black26,
      context: context,
      builder: (context) => actionSheet);

  if (option != null && option != "Cancel") {
    var cachedImg = await DefaultCacheManager().getSingleFile(imgUrl);
    await WallpaperManager.setWallpaperFromFile(
        cachedImg.path, _setAs[option]!);
    getSnackBar(context, "Set Successful");
  }
}
