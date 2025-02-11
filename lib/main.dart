import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_manager/firebase_options.dart';
import 'constants/custome_theme.dart';
import 'gen/colors.gen.dart';
import 'helpers/helper_methods.dart';
import 'loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    rotation();

    return LayoutBuilder(
      builder: (context, constraints) {
        return const UtillScreenMobile();
      },
    );
  }
}

class UtillScreenMobile extends StatelessWidget {
  const UtillScreenMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, _) async {
            showMaterialDialog(context);
          },
          child: GetMaterialApp(
              //    showPerformanceOverlay: true,
              theme: ThemeData(
                  unselectedWidgetColor: Colors.white,
                  primarySwatch: CustomTheme.kToDark,
                  useMaterial3: false,
                  scaffoldBackgroundColor: AppColors.cFFFFFF,
                  appBarTheme: const AppBarTheme(
                      color: AppColors.cFFFFFF, elevation: 0)),
              debugShowCheckedModeBanner: false,
              builder: (context, widget) {
                return MediaQuery(data: MediaQuery.of(context), child: widget!);
              },
              home: const Loading()),
        );
      },
    );
  }
}
