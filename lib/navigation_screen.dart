import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_manager/common_widgets/scaffold_bg.dart';
import 'package:user_manager/gen/assets.gen.dart';

import 'constants/text_font_style.dart';
import 'gen/colors.gen.dart';
import 'ui/screen/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Center(child: Text('Alarm Screen')),
    const Center(child: Text('Profile Screen')),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return scaffoldBg(
      context: context,
      imagePath: Assets.images.onboadringBg.path,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _pages,
          ),
          bottomNavigationBar: Container(
            alignment: Alignment.center,
            height: 68.h,
            width: 280.w,
            margin: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppColors.c10375D,
                    AppColors.c2273C3,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [-0.7054, 0.9554],
                ),
                borderRadius: BorderRadius.circular(34.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _onPageChanged(0);
                    _onItemTapped(0);
                  },
                  child: NavItem(
                    name: "Home",
                    icon: Assets.icons.home.path,
                    selectedIndex: _selectedIndex,
                    currentIndex: 0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _onItemTapped(1);
                    _onPageChanged(1);
                  },
                  child: NavItem(
                    name: "Alarm",
                    icon: Assets.icons.alerm.path,
                    selectedIndex: _selectedIndex,
                    currentIndex: 1,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _onItemTapped(2);
                    _onPageChanged(2);
                  },
                  child: NavItem(
                    name: "Profile",
                    icon: Assets.icons.profile.path,
                    selectedIndex: _selectedIndex,
                    currentIndex: 2,
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class NavItem extends StatelessWidget {
  final String icon;
  final String name;
  final int currentIndex;
  final int selectedIndex;
  const NavItem({
    super.key,
    required this.icon,
    required this.name,
    required this.currentIndex,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          height: 24.h,
          width: 24.w,
          color:
              selectedIndex == currentIndex ? Colors.white : AppColors.cB1B1B1,
        ),
        Text(
          name,
          style: TextFontStyle.textStyle14cFFFFFFRoboto500.copyWith(
              color: selectedIndex == currentIndex ? null : AppColors.cB1B1B1),
        )
      ],
    );
  }
}
