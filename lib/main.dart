import 'package:flutter/material.dart';
import 'package:hello/button_page.dart';
import 'package:hello/flex_page.dart';
import 'package:hello/image_page.dart';
import 'package:hello/input_page.dart';
import 'package:hello/layout_page.dart';
import 'package:hello/popup_page.dart';
import 'package:hello/setting_page.dart';
import 'drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const LayoutPage(),
        '/setting': (context) => const SettingPage(),
        '/popup': (context) => const PopupPage(),
        '/flex': (context) => const FlexPage(),
        '/image': (context) => const ImagePage(),
        '/button': (context) => const ButtonPage(),
        '/input': (context) => const InputPage()
      },
    );
  }
}

