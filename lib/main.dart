import 'package:flutter/material.dart';
import 'package:technews_app/pages/home.dart';
import 'package:technews_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,primaryColor: AppColors.primary,
      ),
      home: const Home(),
    );
  }
}



