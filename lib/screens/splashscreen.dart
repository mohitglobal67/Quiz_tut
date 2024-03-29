import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app_tutorial/screens/chatscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const GenerativeAISample()),
      );
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('assets/images/robot6.json')),
    );
  }
}
