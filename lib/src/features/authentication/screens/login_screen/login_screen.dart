import 'package:flutter/material.dart';
import 'package:notexpert/src/constants/image_strings.dart';
import 'package:notexpert/src/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Image(
              image: AssetImage(kLoginLogo),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Text('Login',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: const Color(kPrimaryBlackColor))),
          const SizedBox(
            height: 20,
          ),
          Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline),
                  labelText: 'Email',
                  hintText: AutofillHints.email,
                  hintStyle:
                      TextStyle(fontSize: 13, color: Color(kPrimaryBlackColor)),
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
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: 'Password',
                  hintText: AutofillHints.password,
                  hintStyle:
                      TextStyle(fontSize: 13, color: Color(kPrimaryBlackColor)),
                  labelStyle: TextStyle(
                    fontSize: 14,
                    color: Color(kPrimaryBlackColor),
                  ),
                  suffixIcon: IconButton(
                      onPressed: null, icon: Icon(Icons.remove_red_eye_sharp)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: Text('Forgot Password ?'))),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(kPrimaryBlackColor),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20),
                      ))),
            ],
          )),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Or continue with',
                style: TextStyle(fontSize: 15),
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
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the radius as needed
                      ),
                    ),
                  ),
                  icon: Image(
                    image: AssetImage(kGoogleLogo),
                    width: 20.0,
                  ),
                  onPressed: () {},
                  label: Text(
                    'Google',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(kPrimaryWhiteColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                      text: 'Already Have an Account ? ',
                      style: TextStyle(
                        color: Colors
                            .black, // Set the color for "Already Have an Account ?"
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue, // Set the color for "Sign Up"
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
    )));
  }
}
