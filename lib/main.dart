import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview/views/molecules/bottom_navigation.dart';
import 'package:webview/viewmodels/common/bottom_navigation_viewmodel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavigationViewmodel(),
      child: MaterialApp(
        home: MyBottomNavigationBar(),
      ),
    );
  }
}