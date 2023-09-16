import 'package:flutter/material.dart';
import 'package:notexpert/src/constants/image_strings.dart';
import 'package:notexpert/src/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      ? Colors.black.withOpacity(0.1)
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
                      height: 30,
                    ),
                    const Center(
                      child: Image(
                        image: AssetImage(kLoginLogo),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const Text('Login',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Color(kPrimaryBlackColor))),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(kPrimaryBlackColor),
                            ),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.mail_outline),
                              labelText: 'Email',
                              hintText: AutofillHints.email,
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color(kPrimaryBlackColor)),
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: Color(kPrimaryBlackColor),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(kPrimaryBlackColor),
                            ),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              labelText: 'Password',
                              hintText: AutofillHints.password,
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color(kPrimaryBlackColor)),
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: Color(kPrimaryBlackColor),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.remove_red_eye_sharp)),
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
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(kPrimaryBlackColor),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                onPressed: () {},
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 20),
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
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
                          height: 30,
                        ),
                        SizedBox(
                          height: 50,
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
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {},
                            child: RichText(
                              text: const TextSpan(
                                text: 'Already Have an Account ? ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors
                                      .black, // Set the color for "Already Have an Account ?"
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .blue, // Set the color for "Sign Up"
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
