import 'package:flutter/material.dart';
import 'package:user_manager/ui/screen/auth/sign_in_page.dart';
import 'package:user_manager/ui/screen/home_screen.dart';
import 'package:user_manager/ui/state_holders/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  moveToNextScreen() async {
    bool authStatus = await AuthController.checkAuthStatus();
    await Future.delayed(Duration(seconds: 2));
    // Get.find<TotalDueController>().getTotalDue();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) => authStatus ? HomeScreen() : SignInPage()),
        (route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    moveToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
