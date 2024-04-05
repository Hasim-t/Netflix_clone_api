import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix__clone/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer( const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
            'asset/HD-wallpaper-netflix-logo-black-logo-minimal-netflix.jpg'));
  }
}
