import 'package:flutter/material.dart';
import 'package:notexpert/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:notexpert/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:notexpert/src/utils/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomAppTheme.lightTheme,
      darkTheme: CustomAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const LoginScreen(),
    );
  }
}
