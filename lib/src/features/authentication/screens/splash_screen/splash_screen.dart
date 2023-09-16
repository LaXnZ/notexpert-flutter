import 'package:notexpert/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:notexpert/src/constants/image_strings.dart';
import 'package:notexpert/src/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //i need to fit this image into the mobile screen
        body: SafeArea(
      child: Stack(
        children: [
          Positioned(
            child: Image(
              image: AssetImage(
                MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? kSplashLogoDark
                    : kSplashLogoLight,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            left: 0,
            top: -50,
          ),

          //give me a button here to proceed this to the next screen (login)
          Positioned(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return FadeTransition(
                        opacity: animation,
                        child: LoginScreen(),
                      );
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                primary:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? const Color(kPrimaryBlueColor)
                        : const Color(kPrimaryBlackColor),
                onPrimary:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? const Color(kPrimaryBlackColor)
                        : Color(kPrimaryWhiteColor),
              ),
              child: const Text('Get Started'),
            ),
            width: 159,
            left: MediaQuery.of(context).size.width / 2 - 159 / 2,
            top: 350,
          ),

          Positioned(
            child: Image(
              image: AssetImage(kSplashImage),
            ),
            width: MediaQuery.of(context).size.width,
            left: 0,
            bottom: 0,
          ),
        ],
      ),
    ));
  }
}
