import 'package:final_pro/components/constant.dart';
import 'package:final_pro/screens/category_screen/category.dart';
import 'package:final_pro/screens/home.dart';
import 'package:final_pro/screens/profile.dart';
import 'package:final_pro/screens/team.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const ProfileScreen(),
    TeamPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.black,
        selectedItemColor: kBackGroundColor,
        backgroundColor: const Color(0xffeff5fb),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_sharp), label: 'category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: 'profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.groups_outlined), label: 'app_info'),
        ],
        onTap: (index) {
          setState(() {});
          currentIndex = index;
        },
      ),
    );
  }
}
