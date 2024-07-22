// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../constants/dimensions.dart';
import '../setup/app_details.dart';
import '../components/novel_text.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).primaryColorDark,
            Theme.of(context).primaryColorLight,
            Theme.of(context).backgroundColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: Dimensions.pagePadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      textName: "Welcome !!",
                      fontSize: Dimensions.appBarTitle,
                      letterSpacing: 4,
                      textColor: Theme.of(context).textTheme.labelLarge!.color,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomText(
                      textName: "Sign in to start app",
                      fontWeight: FontWeight.w200,
                      letterSpacing: 1,
                      fontSize: Dimensions.appBarSubTitle,
                      textColor: Theme.of(context).textTheme.labelLarge!.color,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.4,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            fit: BoxFit.contain,
                            image:
                                AssetImage("assets/app elements/app_logo.jpg")),
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: CustomText(
                      textName: appName,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                      fontSize: 24,
                      textColor: Theme.of(context).textTheme.labelLarge!.color,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Center(
                    child: CustomText(
                      textName: appDescription,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2,
                      textAlign: TextAlign.center,
                      fontSize: 12,
                      maxLines: 100,
                      textColor: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .color!
                          .withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Center(
                    child: GestureDetector(
                        onTap: () {
                          // final provider = Provider.of<MyAppProvider>(context,
                          //     listen: false);
                          // provider.googleLogin();
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.15,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Theme.of(context).indicatorColor,
                          ),
                          alignment: Alignment.center,
                          child: CustomText(
                            textName: "Sign In",
                            letterSpacing: 4,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            textColor:
                                Theme.of(context).textTheme.titleLarge!.color,
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
