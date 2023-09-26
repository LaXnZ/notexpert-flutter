import 'package:flutter/material.dart';
import 'package:notexpert/src/constants/image_strings.dart';
import 'package:notexpert/src/constants/colors.dart';
import 'package:notexpert/src/features/authentication/screens/registration_screen/registration_screen.dart';
import 'package:notexpert/src/features/authentication/controller/signin_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;
    final controller = Get.put(SignInController());
    final _formKey = GlobalKey<FormState>();

    // Define the text color based on the theme brightness
    Color textColor = currentBrightness == Brightness.dark
        ? Color(kPrimaryWhiteColor) // Use white color for light theme
        : Color(kPrimaryBlackColor); // Use black color for dark theme

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
                      : Colors.white.withOpacity(
                          0.5), // Change the opacity value here (0.5 for 50% opacity)
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
                      'Sign In',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color:
                            textColor, // Set the text color based on the theme
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: controller.email,
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  textColor, // Set the text color based on the theme
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail_outline),
                              labelText: 'Email',
                              hintText: AutofillHints.email,
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color:
                                    textColor, // Set the hint text color based on the theme
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color:
                                    textColor, // Set the label text color based on the theme
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: controller.password,
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  textColor, // Set the text color based on the theme
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              labelText: 'Password',
                              hintText: AutofillHints.password,
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color:
                                    textColor, // Set the hint text color based on the theme
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color:
                                    textColor, // Set the label text color based on the theme
                              ),
                              suffixIcon: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.remove_red_eye_sharp),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password ?',
                                    style: TextStyle(fontSize: 15),
                                  ))),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(kPrimaryBlackColor),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    SignInController.instance.loginUser(
                                      controller.email.text.trim(),
                                      controller.password.text.trim(),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(fontSize: 20),
                                )),
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
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Adjust the radius as needed
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
                                      child: RegistrationScreen(),
                                    );
                                  },
                                ),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'Dont Have an Account ? ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      textColor, // Set the text color based on the theme
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 117,
                                          175), // Use textColor here
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
