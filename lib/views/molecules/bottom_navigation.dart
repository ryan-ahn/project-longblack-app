import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview/viewmodels/common/bottom_navigation_viewmodel.dart';
import 'package:webview/views/pages/main_screen.dart';
import 'package:webview/views/pages/menu_screen.dart';
import 'package:webview/views/pages/setting_screen.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final List<Widget> _screens = [MainScreen(), MenuScreen(), SettingScreen()];

  @override
  Widget build(BuildContext context) {
    var screenManager = Provider.of<BottomNavigationViewmodel>(context);

    return Scaffold(
      body: _screens[screenManager.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff202020),
        selectedItemColor: Color(0xff9fe99f),
        unselectedItemColor: Color(0xffffffff),
        currentIndex: screenManager.currentIndex,
        onTap: (index) {
          var screenManager =
              Provider.of<BottomNavigationViewmodel>(context, listen: false);
          screenManager.changeScreen(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'setting',
          ),
        ],
      ),
    );
  }
}
