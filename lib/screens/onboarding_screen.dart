import 'package:flutter/material.dart';
import 'package:flutter_application_test/screens/login_screen.dart';
import 'package:flutter_application_test/widgets/custom_button.dart';
import 'package:flutter_application_test/screens/signup_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const String routeName = "/onboarding";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Twitch Clone",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButton(
                text: "Log In",
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                  // Handle log in action
                },
              ),
            ),
            CustomButton(
              text: "Sign Up",
              onTap: () {
                Navigator.pushNamed(context, SignupScreen.routeName);
                // Handle sign up action
              },
            ),
          ],
        ),
      ),
    );
  }
}
