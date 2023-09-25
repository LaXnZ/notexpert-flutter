import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notexpert/firebase_options.dart';
import 'package:notexpert/src/features/authentication/screens/edit_screen/edit_screen.dart';
import 'package:notexpert/src/features/authentication/screens/homepage_screen/home_screen.dart';
import 'package:notexpert/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:notexpert/src/features/authentication/screens/search_notes_screen/search_notes_screen.dart';
import 'package:notexpert/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:notexpert/src/repository/authentication_repository/authentication_repository.dart';
import 'package:notexpert/src/utils/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomAppTheme.lightTheme,
      darkTheme: CustomAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const LoginScreen(),
    );
  }
}
