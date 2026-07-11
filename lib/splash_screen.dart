import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double scale = 0.5;

  @override
  void initState() {
    super.initState();

    // Start logo animation
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!mounted) return;

      setState(() {
        scale = 1;
      });
    });

    // Navigate after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const Home(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedScale(
          duration: const Duration(seconds: 1),
          scale: scale,
          curve: Curves.elasticOut,
          child: Image.asset(
            "assets/img/app_icon/app_logo.png",
            width: 170,
          ),
        ),
      ),
    );
  }
}