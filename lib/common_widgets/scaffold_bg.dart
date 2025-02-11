import 'package:flutter/material.dart';

Container scaffoldBg(
    {required BuildContext context,
    required String imagePath,
    required Widget child}) {
  return Container(
      height: MediaQuery.of(context).size.height, // Full-screen height
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath), // Path to your image
          // Cover the entire screen
        ),
      ),
      child: child);
}
