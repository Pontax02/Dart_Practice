import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const String routeName = "/onboarding";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to Twitch Clone",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
        ],
      ),
    );
  }
}
