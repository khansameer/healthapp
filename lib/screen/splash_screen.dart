import 'dart:async';

import 'package:flutter/material.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/main.dart';
import 'package:junohealthapp/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../core/image/image_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthProvider>().redirectToLogin(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: colorSplash,
      body: Center(
        child: setAssetImage(
            image: icLogo, width: size.width * 0.5, height: size.height * 0.2),
      ),
    );
  }
}
