import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide/core/helper/image_paths.dart';
import 'package:tour_guide/core/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.pushNamed(context, AppRoutes.layoutScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(ImagePaths.bg_logo),
            FadeInDown(
                duration: const Duration(seconds: 3),
                child: Image.asset(
                  ImagePaths.mainlogo,
                )),
          ],
        ),
      ),
    );
  }
}
