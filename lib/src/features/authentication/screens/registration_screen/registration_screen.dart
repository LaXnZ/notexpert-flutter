import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notexpert/src/constants/image_strings.dart';
import 'package:notexpert/src/constants/colors.dart';
import 'package:notexpert/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:notexpert/src/features/authentication/controller/signup_controller.dart';

import '../../models/user.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    Brightness currentBrightness = Theme.of(context).brightness;

    Color textColor = currentBrightness == Brightness.dark
        ? Color(kPrimaryWhiteColor)
        : Color(kPrimaryBlackColor);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenHeight = constraints.maxHeight;
          return Container(
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.black.withOpacity(0.4)
                      : Colors.white.withOpacity(0.5),
                  BlendMode.srcOver,
                ),
                image: AssetImage(
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? kBackgroundImageDark
                      : kBackgroundImageLight,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Image(
                        image: AssetImage(kLoginLogoDark),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: controller.firstname,
                            style: TextStyle(
                              fontSize: 14,
                              color: textColor,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: 'First Name',
                              hintText: 'first name',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: textColor,
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: textColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: controller.lastname,
                            style: TextStyle(
                              fontSize: 14,
                              color: textColor,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Last Name',
                              hintText: 'last name',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: textColor,
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: textColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: controller.email,
                            style: TextStyle(
                              fontSize: 14,
                              color: textColor,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail_outline),
                              labelText: 'Email',
                              hintText: AutofillHints.email,
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: textColor,
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: textColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: controller.password,
                            style: TextStyle(
                              fontSize: 14,
                              color: textColor,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              labelText: 'Password',
                              hintText: AutofillHints.password,
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: textColor,
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: textColor,
                              ),
                              suffixIcon: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.remove_red_eye_sharp),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(kPrimaryBlackColor),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // SignUpController.instance.registerUser(
                                  //   controller.email.text.trim(),
                                  //   controller.password.text.trim(),
                                  // );

                                  final user = User(
                                    firstName: controller.firstname.text.trim(),
                                    lastName: controller.lastname.text.trim(),
                                    email: controller.email.text.trim(),
                                    password: controller.password.text.trim(),
                                  );

                                  SignUpController.instance.createUser(user);
                                }
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Or continue with',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(kPrimaryBlueColor)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            icon: const Image(
                              image: AssetImage(kGoogleLogo),
                              width: 20.0,
                            ),
                            onPressed: () {},
                            label: const Text(
                              'Google',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(kPrimaryWhiteColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: LoginScreen(),
                                    );
                                  },
                                ),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'Already Have an Account ? ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: textColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign In',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 117, 175),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
