import 'package:flutter/material.dart';
import 'package:flutter_application_test/widgets/custom_button.dart';

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
          const SizedBox(height: 20),
          CustomButton(
            text: "Log In",
            onTap: () {
              // Handle log in action
            },
          ),
        ],
      ),
    );
  }
}
