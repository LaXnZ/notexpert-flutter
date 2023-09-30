import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notexpert/src/constants/sizes.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;

    Color textColor = currentBrightness == Brightness.dark
        ? Color(kPrimaryWhiteColor)
        : Color(kPrimaryBlackColor);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => {Get.back()},
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.black)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 50.0),
              child: Expanded(
                child: Text('Edit Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: kTitleFontSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Color(kPrimaryBlackColor),
                    )),
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Stack(
                children: [
                  SizedBox(
                    width: 130,
                    height: 130,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(image: AssetImage(kUserProfileImage))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: kDefaultIconDarkColor.withOpacity(0.5)),
                      child: const Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30.0),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.blue)),
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
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.blue)),
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
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.blue)),
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
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.blue)),
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
                  SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    width: 200,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(kPrimaryBlueColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Update Profile',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
