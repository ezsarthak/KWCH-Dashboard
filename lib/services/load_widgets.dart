// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:archive/archive.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class LoadWidget {
  static Future<List<String>> getwidgets(BuildContext context) async {
    DefaultCacheManager().emptyCache();
    imageCache.clear();
    imageCache.clearLiveImages();
    Directory tempDir = await getApplicationCacheDirectory();
    String tempPath = tempDir.path;
    List<String> listaAssetsFiltered = [];
    List<String> all = [];

    // String source = 'None';
    // // Platform messages are asynchronous, so we initialize in an async method.
    // Future<void> initPlatformState() async {
    //   Source installationSource;
    //   // Platform messages may fail, so we use a try/catch PlatformException.
    //   try {
    //     //get origin of installed application
    //     installationSource = await StoreChecker.getSource;
    //   } on PlatformException {
    //     installationSource = Source.UNKNOWN;
    //   }
    //   switch (installationSource) {
    //     case Source.IS_INSTALLED_FROM_PLAY_STORE:
    //       // Installed from Play Store
    //       source = "Play Store";

    //       Dimensions.initapp = true;

    //       break;
    //     case Source.IS_INSTALLED_FROM_PLAY_PACKAGE_INSTALLER:
    //       // Installed apk from Google Package installer/ firebase app tester
    //       source = "Google Package installer";

    //       break;
    //     case Source.IS_INSTALLED_FROM_RU_STORE:
    //       // Installed apk from RuStore
    //       source = "RuStore";
    //       break;
    //     case Source.IS_INSTALLED_FROM_LOCAL_SOURCE:
    //       // Installed using adb commands or side loading or any cloud service
    //       source = "Local Source";
    //       break;
    //     case Source.IS_INSTALLED_FROM_AMAZON_APP_STORE:
    //       // Installed from Amazon app store
    //       source = "Amazon Store";
    //       break;
    //     case Source.IS_INSTALLED_FROM_HUAWEI_APP_GALLERY:
    //       // Installed from Huawei app store
    //       source = "Huawei App Gallery";
    //       break;
    //     case Source.IS_INSTALLED_FROM_SAMSUNG_GALAXY_STORE:
    //       // Installed from Samsung app store
    //       source = "Samsung Galaxy Store";
    //       break;
    //     case Source.IS_INSTALLED_FROM_SAMSUNG_SMART_SWITCH_MOBILE:
    //       // Installed from Samsung Smart Switch Mobile
    //       source = "Samsung Smart Switch Mobile";
    //       break;
    //     case Source.IS_INSTALLED_FROM_XIAOMI_GET_APPS:
    //       // Installed from Xiaomi app store
    //       source = "Xiaomi Get Apps";
    //       break;
    //     case Source.IS_INSTALLED_FROM_OPPO_APP_MARKET:
    //       // Installed from Oppo app store
    //       source = "Oppo App Market";
    //       break;
    //     case Source.IS_INSTALLED_FROM_VIVO_APP_STORE:
    //       // Installed from Vivo app store
    //       source = "Vivo App Store";
    //       break;
    //     case Source.IS_INSTALLED_FROM_OTHER_SOURCE:
    //       // Installed from other market store
    //       source = "Other Source";
    //       break;
    //     case Source.IS_INSTALLED_FROM_APP_STORE:
    //       // Installed from iOS app store
    //       source = "App Store";
    //       break;
    //     case Source.IS_INSTALLED_FROM_TEST_FLIGHT:
    //       // Installed from Test Flight
    //       source = "Test Flight";
    //       break;
    //     case Source.UNKNOWN:
    //       // Installed from Unknown source
    //       source = "Unknown Source";
    //       break;
    //   }
    // }

    var assetsFile =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(assetsFile);
    // await initPlatformState();

    //Filter .zip
    List<String> listzip =
        manifestMap.keys.where((String key) => key.contains('.zip')).toList();

    for (String zip in listzip) {
      listaAssetsFiltered.add(zip);
    }

    Future<File> getImageFileFromAssets(String path) async {
      final byteData = await rootBundle.load(path);
      final buffer = byteData.buffer;
      Random random = Random();
      int randomNumber = random.nextInt(100000000);
      var filePath =
          '$tempPath/$randomNumber'; // file_01.tmp is dump file, can be anything
      return File(filePath).writeAsBytes(
          buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }

    for (var element in listaAssetsFiltered) {
      File zippedFile = await getImageFileFromAssets(element);
      var bytes = zippedFile.readAsBytesSync();
      var archive = ZipDecoder().decodeBytes(bytes);
      for (var file in archive) {
        var fileName = '$tempPath/$zippedFile/${file.name}';
        if (file.isFile) {
          var outFile = File(fileName);
          // print('File:: ${outFile.path}');
          if (outFile.path.endsWith(".jpg")) {
            all.add(outFile.path);
          }
          if (outFile.path.endsWith("preset.json")) {
            all.add(outFile.path);
          }
          outFile = await outFile.create(recursive: true);
          await outFile.writeAsBytes(file.content);
        }
      }
    }
    // print(all);
    return all;
  }
}
