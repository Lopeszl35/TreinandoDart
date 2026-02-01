import 'package:flutter/material.dart';

class ButtonModel {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  bool isBig;

  ButtonModel({
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.isBig = false  
  });
}