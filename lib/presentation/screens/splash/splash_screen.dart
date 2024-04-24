import 'package:flutter/material.dart';
import 'package:flutter_micro_frontend/presentation/utils/definition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(ImageConst.splash),
      ),
    );
  }
}
