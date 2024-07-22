// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../constants/dimensions.dart';
import '../components/loading_widget.dart';
import '../components/novel_text.dart';
import '../constants/novel_colors.dart';
import 'navigatin_screen.dart';
import '../services/load_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<List<String>> imgObject;

  @override
  void initState() {
    imgObject = LoadWidget.getwidgets(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>>(
        future: imgObject.whenComplete(
            () => Future.delayed(const Duration(milliseconds: 2000))),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Dimensions.initapp
                ? NavigationScreen(
                    snapshot: snapshot,
                  )
                : const ErrorWidget();
          } else {
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
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.35,
                      ),
                      child: const Center(child: LoadingWidget()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: CustomText(
                                  textName: 'App Starting',
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 2,
                                  fontSize: 12,
                                  textColor: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .color!
                                      .withOpacity(0.6),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Center(
                                child: SpinKitWave(
                                  size: MediaQuery.of(context).size.width * 0.1,
                                  color: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .color!
                                      .withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          CustomText(
                            textName: 'Powered by Novel Dashboard',
                            fontWeight: FontWeight.normal,
                            letterSpacing: 2,
                            fontSize: 12,
                            textColor: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .color!
                                .withOpacity(0.6),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: Dimensions.pagePadding,
          child: const Center(
            child: CustomText(
              textName:
                  'Error while opening the app. Make sure you have installed it from play store and updated',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              textColor: Colors.black,
              lineHeight: 1.5,
              letterSpacing: 3,
              textOverflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ),
        ),
      ),
    );
  }
}
