import 'package:flutter/material.dart';
import 'package:notexpert/src/constants/image_strings.dart';
import 'package:notexpert/src/constants/colors.dart';
import 'package:notexpert/src/features/authentication/screens/login_screen/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;

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
                      height: 20,
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color:
                            textColor, // Set the text color based on the theme
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  textColor, // Set the text color based on the theme
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: 'First Name',
                              hintText: 'first name',
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
                            height: 15,
                          ),
                          TextFormField(
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  textColor, // Set the text color based on the theme
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Last Name',
                              hintText: 'last name',
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
                            height: 15,
                          ),
                          TextFormField(
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
                            height: 15,
                          ),
                          TextFormField(
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
                            height: 15,
                          ),
                          TextFormField(
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  textColor, // Set the text color based on the theme
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              labelText: 'Confirm Password',
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
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password ?',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
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
                              onPressed: () {},
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
                                  color:
                                      textColor, // Set the text color based on the theme
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign In',
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
