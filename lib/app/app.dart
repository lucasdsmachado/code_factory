
import 'package:code_factory/app/pages/account_pages.dart';
import 'package:code_factory/app/pages/login_page.dart';
import 'package:code_factory/app/pages/product_detail.dart';
import 'package:code_factory/app/pages/profile_screens/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Code Factory',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Rubik",
      ),
      home:  const LoginPage(),
    );
  }
}
