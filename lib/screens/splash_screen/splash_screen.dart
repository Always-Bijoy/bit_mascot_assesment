import 'package:erp/screens/splash_screen/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/bounce_animation/bounce_animation_builder.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SplashProvider(context),
      child: Scaffold(
        body: Consumer<SplashProvider>(
          builder: (context, provider, _) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BounceAnimationBuilder(
                    builder: (_, __) {
                      return Center(
                        child: InteractiveViewer(
                          scaleEnabled: false,
                          boundaryMargin:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Image.asset(
                            "assets/bit.jpeg",
                            scale: 3,
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
      /*child: Scaffold(
        backgroundColor: Colors.white,
        body: ChangeNotifierProvider(
          create: ( context) => SplashProvider(context),
          child:
        ),
      ),*/
    );
  }
}
