import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitRipple(
        size: MediaQuery.of(context).size.height * 0.25,
        // trackColor:
        //     Theme.of(context).textTheme.labelLarge!.color!.withOpacity(0.4),
        // waveColor: Theme.of(context).textTheme.titleSmall!.color!,
        color: Theme.of(context).indicatorColor,
      ),
    );
  }
}
