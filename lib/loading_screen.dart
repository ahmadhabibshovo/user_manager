import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_manager/features/auth/sign_in_screen.dart';
import 'package:user_manager/navigation_screen.dart';
import 'package:user_manager/ui/screen/auth/sign_in_page.dart';

import 'constants/app_constants.dart';

import 'splash_screen.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    completeLoading();
  }

  completeLoading() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.offAll(const SignInScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
