import 'dart:async';

import 'package:basic_flutter_structure/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.main,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset("assets/images/logo.png",scale: 1.w,),
      ),
    );
  }
}
