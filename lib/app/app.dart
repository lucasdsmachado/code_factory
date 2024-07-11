import 'package:code_factory/app/pages/initial_pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:code_factory/app/controller/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Code Factory',
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: "Rubik",
            brightness: Brightness.light,
            primaryColor: const Color(0xffE3562A),
            dividerColor: Colors.black26,
            iconTheme: const IconThemeData(color: Colors.black),
            scaffoldBackgroundColor: Colors.white,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.black54),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Color(0xffE3562A)),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            fontFamily: "Rubik",
            brightness: Brightness.dark,
            primaryColor: const Color(0xffE3562A),
            dividerColor: Colors.white38,
            scaffoldBackgroundColor: Colors.grey[850],
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
              bodySmall: TextStyle(color: Colors.white),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Color(0xffE3562A)),
          ),
          themeMode:
              themeProvider.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
          home: const SplashScreen(),
        );
      },
    );
  }
}
