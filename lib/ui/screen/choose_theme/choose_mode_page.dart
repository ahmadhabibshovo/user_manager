import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:user_manager/ui/screen/choose_theme/widget/labeled_icon_button.dart';
import 'package:user_manager/ui/screen/home_screen.dart';

import '../../../core/config/assets/app_images.dart';
import '../../../core/config/assets/app_vectors.dart';

class ChooseModePage extends StatefulWidget {
  const ChooseModePage({super.key});

  @override
  State<ChooseModePage> createState() => _ChooseModePageState();
}

class _ChooseModePageState extends State<ChooseModePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.chooseModeBg),
              ),
            ),
          ),
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        const Text(
                          'Choose Mode',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LabeledIconButton(
                              onTap: () {},
                              label: 'Light Mode',
                              iconPath: AppVectors.sun,
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            LabeledIconButton(
                              onTap: () {
                                //dark
                              },
                              label: 'Dark Mode',
                              iconPath: AppVectors.moon,
                            ),
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize:
                                    const Size.fromWidth(double.maxFinite)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(32.0),
                              child: Text(
                                'Continue',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ].separatedBy(const SizedBox(
                        height: 80,
                      )),
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
