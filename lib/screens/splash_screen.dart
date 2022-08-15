import 'dart:async';

import 'package:bike/auth/login.dart';
import 'package:bike/provider/sign_in_provider.dart';
import 'package:bike/screens/home.dart';
import 'package:bike/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();
    // create a timer of 2 seconds
    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == false
          ? Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=> const LoginPage()))
          : Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=> const HomePage()));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
              child: Image(
                image: AssetImage(Config.app_icon),
                height: 80,
                width: 80,
              )),
        )
    );
  }
}
