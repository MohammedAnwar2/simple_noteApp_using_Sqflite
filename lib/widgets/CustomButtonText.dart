import 'package:flutter/material.dart';

class CustomButtonText extends StatelessWidget {
  const CustomButtonText({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(text,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),);
  }
}