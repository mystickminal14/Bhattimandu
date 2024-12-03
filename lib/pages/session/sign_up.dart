import 'package:bhattimandu/components/form/custom_bhatti_btn.dart';
import 'package:bhattimandu/components/form/custom_textfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isPasswordVisible = false;
  String? userType = ''; // Moved outside build method to persist state.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Enable resizing to avoid keyboard overlap
      body: SafeArea(
        child: SingleChildScrollView( // Make the entire body scrollable
          child: Container(
            padding: const EdgeInsets.only(
              top: 10,
              left: 25,
              bottom: 20,
              right: 25,
            ),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.all(0),
                  child: const Image(
                    image: AssetImage('images/bhattimandu-logo.png'),
                    fit: BoxFit.cover,
                    width: 240,
                    height: 170,
                  ),
                ),
                const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Color(0xffF5F5DC),
                    fontSize: 35,
                    fontFamily: 'lovelo',
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Name',
                  hintText: 'enter your name',
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Email Address',
                  hintText: 'enter email address',
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Contact Number',
                  hintText: 'enter your number',
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Text(
                      "Select Role",
                      style: TextStyle(
                        fontFamily: 'roboto',
                        fontSize: 16,
                        color: Color(0xffF5F5DC),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Buyer',
                          groupValue: userType,
                          onChanged: (value) {
                            setState(() {
                              userType = value;
                            });
                          },
                        ),
                        const Text(
                          'Buyer',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Seller',
                          groupValue: userType,
                          onChanged: (value) {
                            setState(() {
                              userType = value;
                            });
                          },
                        ),
                        const Text(
                          'Seller',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  label: 'Password',
                  hintText: 'enter password',
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  isObscure: !_isPasswordVisible, // Toggle visibility
                  onChanged: (value) {},
                  onIconPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                const SizedBox(height: 8),
                const SizedBox(height: 20),
                CustomBhattiBtn(
                  text: 'Sign Up',
                  onPressed: () {
                    print("Selected Role: $userType");
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'roboto',
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/sign_in');
                      },
                      child: const Text(
                        "Sign In!!",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'roboto-bold',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
