import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:code_factory/app/controller/theme_provider.dart';
import 'package:code_factory/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Carregar o tema inicial do SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkTheme = prefs.getBool('isDarkTheme') ?? false;

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(isDarkTheme: isDarkTheme),
      child: const MyApp(), // Remova o const aqui
    ),
  );
}
