import 'package:flutter/material.dart';

class customTextFomeField extends StatelessWidget {
  customTextFomeField({
    super.key,
    required this.text, required this.label, this.validator, this.onTap, required this.readOnly,
  });

  final String label;
  final TextEditingController text;
  String ? Function(String?)? validator;
  final void Function()? onTap;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      style:  TextStyle(color: Colors.black),
      validator: validator,
      controller: text,
      readOnly: readOnly,
      decoration:  InputDecoration(
        label: Text(label),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
