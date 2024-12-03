import 'package:bhattimandu/components/form/custom_bhatti_btn.dart';
import 'package:bhattimandu/components/form/custom_textfield.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isPasswordVisible = false; // State variable for password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding:
              const EdgeInsets.only(top: 48, left: 25, bottom: 20, right: 25),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(0), // Add margin for spacing
                    child: const Image(
                      image: AssetImage('images/bhattimandu-logo.png'),
                      fit: BoxFit.cover,
                      width: 300,
                      height: 190,
                    ),
                  ),
                  const Text(
                    'Sign in',
                    style: TextStyle(
                        color: Color(0xffF5F5DC),
                        fontSize: 35,
                        fontFamily: 'lovelo'),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: 'Email Address',
                    hintText: 'enter email address',
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 20),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {}, child: const Text('Forget Password?')),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomBhattiBtn(text: 'Sign In', onPressed: () {})
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'roboto',
                      )),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/sign_up');
                    },
                    child: const Text(
                      "Create Account!!",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'roboto-bold',
                          fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
