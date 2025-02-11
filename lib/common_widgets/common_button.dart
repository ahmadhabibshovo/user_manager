import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_manager/constants/text_font_style.dart';

import '../gen/colors.gen.dart';

Widget commonButton({required void Function() onTap, required String title}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      width: 380.w,
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: const LinearGradient(
          colors: [
            AppColors.c10375D,
            AppColors.c2273C3,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [-0.7054, 0.9554],
        ),
      ),
      child: Text(
        title,
        style: TextFontStyle.textStyle16cFFFFFFRoboto500,
      ),
    ),
  );
}
