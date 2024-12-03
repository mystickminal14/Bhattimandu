import 'package:flutter/material.dart';

class CustomBhattiBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;


  const CustomBhattiBtn({
    super.key,
    required this.text,
    required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: const Color(0xffCD7F32),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontFamily: 'roboto-bold',
        ),
      ),
    );
  }
}
