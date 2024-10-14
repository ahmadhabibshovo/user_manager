import 'package:flutter/material.dart';

bool isDarkMode(context) {
  return Theme.of(context).brightness == Brightness.dark;
}
