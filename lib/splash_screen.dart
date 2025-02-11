import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import 'common_widgets/scaffold_bg.dart';
import 'helpers/ui_helpers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: scaffoldBg(
        context: context,
        imagePath: Assets.images.onboadringBg.path,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
            child: Column(
              children: [
                UIHelper.verticalSpace(179.h),
                Image.asset(Assets.icons.appLogo.path)
              ],
            ),
          ),
        ),
      )),
    );
  }
}
