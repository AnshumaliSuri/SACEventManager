// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sac_app/screens/home_page.dart';
import 'package:sac_app/utils/color.dart' as color;
import 'package:sac_app/utils/global_variables.dart';

class Adaptive extends StatelessWidget {
  const Adaptive({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) {
          return const Scaffold(
            body: MobileScreenLayout(),
          );
        });
  }
}

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  void initState() {
    super.initState();
    pageController = PageController();
  }

  int _page = 0;
  late PageController pageController;

  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SAC Event Manager",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: PageView(
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: color.AppColor.homePageBackground,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0
                  ? color.AppColor.selectedIcon
                  : color.AppColor.homeColorIcon,
            ),
            label: 'Home',
            backgroundColor: color.AppColor.homePageBackground,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_events,
              color: _page == 1
                  ? color.AppColor.selectedIcon
                  : color.AppColor.homeColorIcon,
            ),
            label: 'Results',
            backgroundColor: color.AppColor.homePageBackground,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _page == 2
                  ? color.AppColor.selectedIcon
                  : color.AppColor.homeColorIcon,
            ),
            label: 'Admin',
            backgroundColor: color.AppColor.homePageBackground,
          )
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
