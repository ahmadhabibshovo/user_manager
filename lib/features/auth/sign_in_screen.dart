import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_manager/helpers/ui_helpers.dart';

import '../../../gen/assets.gen.dart';
import '../../common_widgets/common_button.dart';
import '../../common_widgets/scaffold_bg.dart';
import '../../common_widgets/styled_textfield.dart';
import '../../constants/text_font_style.dart';
import '../../constants/validatior.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isCheked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: scaffoldBg(
        context: context,
        imagePath: Assets.images.authBg.path,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpace(20.h),
                    Center(
                      child: Text(
                        'Sign In',
                        style: TextFontStyle.textStyle16cFFFFFFRoboto500,
                      ),
                    ),
                    UIHelper.verticalSpace(122.h),
                    Center(
                      child: Text(
                        'Stoic Alarm',
                        style: TextFontStyle.headline24cFFFFFFRoboto600,
                      ),
                    ),
                    UIHelper.verticalSpace(8.h),
                    Center(
                      child: Text(
                        'Welcome back! Sign in to Continue',
                        style: TextFontStyle.textStyle16cEBEBEBRoboto400,
                      ),
                    ),
                    UIHelper.verticalSpace(32.h),
                    Text(
                      'Email Address',
                      style: TextFontStyle.textStyle16cFFFFFFRoboto500,
                    ),
                    UIHelper.verticalSpace(8.h),
                    const StyledTextField(
                      hintText: "Enter your email",
                      validator: emailValidator,
                    ),
                    UIHelper.verticalSpace(16.h),
                    Text(
                      'Password',
                      style: TextFontStyle.textStyle16cFFFFFFRoboto500,
                    ),
                    UIHelper.verticalSpace(8.h),
                    const StyledTextField(
                      isPassword: true,
                      validator: passwordValidator,
                      hintText: "Enter your Password",
                    ),
                    UIHelper.verticalSpace(24.h),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, // Align items at ends
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: _isCheked, // Set initial value as needed
                              onChanged: (bool? value) {
                                setState(() {
                                  _isCheked = value ?? false;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    4.r), // Rounded corners
                              ),
                              side: BorderSide(
                                color:
                                    Colors.white, // Set border color to white
                                width: 2.w, // Adjust width as needed
                              ),
                              activeColor: Colors.white,
                              checkColor: Colors.black,
                            ),
                            Text(
                              'Remember Me',
                              style: TextFontStyle.textStyle12cEBEBEBRoboto500,
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password?',
                            style: TextFontStyle.textStyle14cFFFFFFRoboto500,
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(24.h),
                    commonButton(
                        onTap: () {
                          // _formKey.currentState!.validate();
                        },
                        title: "Sign In"),
                    UIHelper.verticalSpace(24.h),
                    Row(
                      children: [
                        Expanded(
                          // Use Expanded to fill available space
                          child: Container(
                            height: 1.h, // Set line thickness
                            color: Colors.white, // Line color
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w), // Adjust padding as needed
                          child: Text('Or continue with',
                              style: TextFontStyle.textStyle14cFFFFFFRoboto500),
                        ),
                        Expanded(
                          // Use Expanded again for the second line
                          child: Container(
                            height: 1.h, // Set line thickness
                            color: Colors.white, // Line color
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            height: 48.h,
                            width: 48.w,
                            Assets.icons.google.path),
                        UIHelper.horizontalSpace(20.w),
                        Image.asset(
                            height: 48.h, width: 48.w, Assets.icons.apple.path)
                      ],
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center the content
                      children: [
                        Text("Don't have an account?",
                            style: TextFontStyle.textStyle16cEBEBEBRoboto400),
                        TextButton(
                          // Use a TextButton for the link
                          onPressed: () {},
                          child: Text(
                            'Create New',
                            style: TextFontStyle.textStyle16cFEA11FRoboto500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
