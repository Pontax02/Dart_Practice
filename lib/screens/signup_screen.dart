import "package:flutter/material.dart";
import "package:flutter_application_test/screens/home_screen.dart";
import "package:flutter_application_test/widgets/custom_button.dart";
import "package:flutter_application_test/widgets/custom_textfield.dart";
import 'package:flutter_application_test/resources/auth_methods.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const String routeName = "/signup";
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();

  void SignupUser() async {
    bool res = await _authMethods.signUpUser(
      context,
      _emailcontroller.text,
      _usernamecontroller.text,
      _passwordcontroller.text,
    );

    if (res) {
      // Navigate to the next screen or show success message
      Navigator.pushNamed(context, HomeScreen.routeName); // Example navigation
    } else {
      // Show error message
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.1),
              Text("Sign Up Screen"),
              const Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomTextField(controller: _emailcontroller),
              ),
              const SizedBox(height: 20),
              const Text(
                "Username",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomTextField(controller: _usernamecontroller),
              ),
              const SizedBox(height: 20),
              const Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomTextField(controller: _passwordcontroller),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Sign Up",
                onTap: () {
                  // Handle sign up logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
