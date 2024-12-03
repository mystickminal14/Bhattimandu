import 'package:bhattimandu/pages/flashing_page.dart';
import 'package:bhattimandu/pages/session/sign_in.dart';
import 'package:bhattimandu/pages/session/sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color(0xff1C1C2E),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Color(0xffF5F5DC),
          ),
          bodyMedium: TextStyle(
            color: Color(0xffF5F5DC),
          ),
          bodySmall: TextStyle(
            color: Color(0xffF5F5DC),
          ),

        ),
      ),

      routes: {
        '/': (context) => const SignUp(),
        '/bhatti': (context) => const BhattiFlashingPage(),
        '/sign_in': (context) => const SignIn(),
        '/sign_up': (context) => const SignUp()
      },
    );

  }
}
