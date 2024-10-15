import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_manager/bindings.dart';
import 'package:user_manager/core/config/theme/app_theme.dart';
import 'package:user_manager/ui/screen/auth/sign_in_page.dart';

class UserManager extends StatelessWidget {
  const UserManager({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: SignInPage(),
      initialBinding: ControllerBindings(),
    );
  }
}
