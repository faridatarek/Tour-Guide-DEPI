import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/features/placeDetails/view/placeDetails_screen.dart';
import 'package:tour_guide/features/splash/view/onboarding_screen.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 6), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => GuidePager()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              ImagePaths.bg_logo,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fitHeight,
            ),
            FadeInDown(
                duration: Duration(seconds: 3),
                child: Image.asset(
                  ImagePaths.mainlogo,
                )),
          ],
        ),
      ),
    );
  }
}
