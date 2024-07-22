import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/novel_theme.dart';
import '../pages/splash_screen.dart';
import '../utils/shared_preferences.dart';
import '../utils/novel_provider.dart';
import 'package:provider/provider.dart';
import 'setup/app_details.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FirebaseApi().initNoti();
  await UserSimplePrefs.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      /// transparent status bar
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MyAppProvider myAppProvider = MyAppProvider();

  void getCurrentAppTheme() async {
    myAppProvider.darkTheme = await myAppProvider.novelPreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return myAppProvider;
      },
      child: Consumer<MyAppProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            title: appName,
            theme: Styles.themeData(myAppProvider.darkTheme, context),
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: MyBehavior(),
                child: child ?? const SplashScreen(),
              );
            },
            home: const SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
