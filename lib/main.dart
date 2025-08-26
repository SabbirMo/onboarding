import 'package:flutter/material.dart';
import 'package:islamic_app/core/theme/app_color.dart';
import 'package:islamic_app/models/onboarding/screen/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.bgColor),
      ),
      home: OnboardingScreen(),
    );
  }
}
