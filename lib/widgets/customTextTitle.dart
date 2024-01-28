import 'package:flutter/material.dart';

class CutomTextTitle extends StatelessWidget {
  const CutomTextTitle({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),);
  }
}