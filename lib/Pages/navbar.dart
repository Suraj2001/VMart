import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vmart/Pages/cart.dart';
import 'package:vmart/Pages/categories.dart';
import 'package:vmart/Pages/home.dart';
import 'package:vmart/Pages/profile.dart';
import 'package:vmart/theme.dart';

class BottomNavig extends StatefulWidget {
  const BottomNavig({Key? key}) : super(key: key);

  @override
  _BottomNavigState createState() => _BottomNavigState();
}

class _BottomNavigState extends State<BottomNavig> {
  int _currentIndex = 0;
  bool needToPopApp = false;
  final List<Widget> _children = [
    const HomePage(),
    const CartPage(),
    const CategoriesPage(),
    const ProfilePage(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();

  @override
  void initState() {
    super.initState();
  } // Our first view in viewport

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _children[_currentIndex],

      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                color: Colors.black.withOpacity(0.10),
              )
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: VTheme.kPrimaryColor,
            unselectedItemColor: VTheme.lightText.withOpacity(0.5),
            backgroundColor: Colors.white,
            onTap: onTabTapped,
            iconSize: 22,
            selectedLabelStyle: GoogleFonts.montserrat(fontSize: 9),
            unselectedLabelStyle: GoogleFonts.montserrat(
                fontSize: 9, height: 2, letterSpacing: 0.5),
            // new
            currentIndex: _currentIndex,
            // new
            items: [
              BottomNavigationBarItem(
                icon: _currentIndex == 0
                    ? Image.asset(
                        "assets/Icons/home.png",
                        height: 22,
                        color: VTheme.kPrimaryColor,
                      )
                    : Image.asset(
                        "assets/Icons/homefilled.png",
                        height: 22,
                        color: VTheme.lightText.withOpacity(0.5),
                      ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: _currentIndex == 1
                      ? Image.asset(
                          "assets/Icons/cartF.png",
                          height: 22,
                          color: VTheme.kPrimaryColor,
                        )
                      : Image.asset(
                          "assets/Icons/cart.png",
                          height: 22,
                          color: VTheme.lightText.withOpacity(0.5),
                        ),
                  label: "Cart"),
              BottomNavigationBarItem(
                  icon: _currentIndex == 2
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 2.0, top: 2),
                          child: Image.asset(
                            "assets/Icons/categoryF.png",
                            height: 18,
                            color: VTheme.kPrimaryColor,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 2.0, top: 2),
                          child: Image.asset(
                            "assets/Icons/category.png",
                            height: 18,
                            color: VTheme.lightText.withOpacity(0.5),
                          ),
                        ),
                  label: "Category"),
              BottomNavigationBarItem(
                  icon: _currentIndex == 3
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 2.0, top: 2),
                          child: Image.asset(
                            "assets/Icons/profileF.png",
                            height: 18,
                            color: VTheme.kPrimaryColor,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 2.0, top: 2),
                          child: Image.asset(
                            "assets/Icons/profile.png",
                            height: 18,
                            color: VTheme.lightText.withOpacity(0.5),
                          ),
                        ),
                  label: "Profile"),
            ],
          ),
        ),
      ),
      // endDrawer: drawer,
    );
  }
}
