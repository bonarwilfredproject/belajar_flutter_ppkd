import 'package:flutter/material.dart';

InputDecoration decorationConstant({required String hintText, Color? color}) {
  return InputDecoration(
    hintText: hintText,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.grey),
    ),
  );
}
