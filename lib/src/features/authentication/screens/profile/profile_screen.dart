import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notexpert/src/features/authentication/screens/homepage_screen/home_screen.dart';
import 'package:notexpert/src/features/authentication/screens/profile/update_profile_screen.dart';
import 'package:notexpert/src/constants/colors.dart';
import 'package:notexpert/src/constants/image_strings.dart';
import 'package:notexpert/src/repository/authentication_repository/authentication_repository.dart';

import '../../../../common_widgets/navbar.dart';
import '../../controller/profile_controller.dart';
import '../../models/user.dart';
import '../search_notes_screen/search_notes_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Widget> _screens = [
    const HomePage(),
    const SearchNotes(),
    const ProfileScreen(),
    const ProfileScreen(),
  ];

  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => _screens[index],
        transitionsBuilder: (context, animation1, animation2, child) {
          return FadeTransition(
            opacity: animation1,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var textColor = isDark ? kPrimaryWhiteColor : kPrimaryBlackColor;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        toolbarHeight: 110.0,
        leading: IconButton(
          icon: IconButton(
              onPressed: () {
                Get.to(() => const HomePage());
              },
              icon: Image.asset(kHomePageLogo)),
          onPressed: () {},
          iconSize: 90,
          alignment: Alignment.centerLeft,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16.0, top: 26.0, bottom: 26.0),
            decoration: BoxDecoration(
                color: const Color.fromARGB(0, 238, 238, 238),
                borderRadius: BorderRadius.circular(10.0)),
            child: IconButton(
              onPressed: () {
                AuthenticationRepository.instance.signOut(context);
              },
              iconSize: 35,
              icon: const Icon(
                Icons.logout,
                color: Color(kPrimaryBlackColor),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: FutureBuilder(
            future: controller.getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  User userData = snapshot.data as User;

                  final firstname = userData.firstName;
                  final lastname = userData.lastName;
                  final email = userData.email;

                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 130,
                            height: 130,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: const Image(
                                    image: AssetImage(kUserProfileImage))),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  color:
                                      kDefaultIconDarkColor.withOpacity(0.5)),
                              child: const Icon(
                                Icons.edit_rounded,
                                color: Colors.white,
                                size: 21,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        firstname + ' ' + lastname,
                        style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Color(kPrimaryBlackColor)),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        email,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(kPrimaryBlackColor)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),

                      //Menu
                      ListTile(
                        onTap: () => Get.to(() => const UpdateProfileScreen()),
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: kDefaultIconDarkColor.withOpacity(0.1)),
                          child: const Icon(
                            Icons.person,
                            color: Color(kPrimaryBlackColor),
                          ),
                        ),
                        title: const Text(
                          'Edit Profile Information',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(kPrimaryBlackColor)),
                        ),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: kDefaultIconDarkColor.withOpacity(0.1)),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                      ),

                      ListTile(
                        onTap: () {},
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: kDefaultIconDarkColor.withOpacity(0.1)),
                          child: const Icon(
                            Icons.notifications,
                            color: Color(kPrimaryBlackColor),
                          ),
                        ),
                        title: const Text(
                          'Notifications',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(kPrimaryBlackColor)),
                        ),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: kDefaultIconDarkColor.withOpacity(0.1)),
                          child: const Icon(
                            Icons.toggle_on_rounded,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: kDefaultIconDarkColor.withOpacity(0.1)),
                          child: const Icon(
                            Icons.language,
                            color: Color(kPrimaryBlackColor),
                          ),
                        ),
                        title: const Text(
                          'Language',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(kPrimaryBlackColor)),
                        ),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: kDefaultIconDarkColor.withOpacity(0.1)),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: kDefaultIconDarkColor.withOpacity(0.1)),
                          child: const Icon(
                            Icons.security,
                            color: Color(kPrimaryBlackColor),
                          ),
                        ),
                        title: const Text(
                          'Security',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(kPrimaryBlackColor)),
                        ),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: kDefaultIconDarkColor.withOpacity(0.1)),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: kDefaultIconDarkColor.withOpacity(0.1)),
                          child: const Icon(
                            Icons.colorize,
                            color: Color(kPrimaryBlackColor),
                          ),
                        ),
                        title: const Text(
                          'Theme',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(kPrimaryBlackColor)),
                        ),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: kDefaultIconDarkColor.withOpacity(0.1)),
                          child: Icon(
                            isDark
                                ? Icons.light_mode_rounded
                                : Icons.dark_mode_rounded,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: kDefaultIconDarkColor.withOpacity(0.1)),
                          child: const Icon(
                            Icons.contact_support_rounded,
                            color: Color(kPrimaryBlackColor),
                          ),
                        ),
                        title: const Text(
                          'Help & Support',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(kPrimaryBlackColor)),
                        ),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: kDefaultIconDarkColor.withOpacity(0.1)),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                      ),

                      ListTile(
                        onTap: () {},
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: kDefaultIconDarkColor.withOpacity(0.1)),
                          child: const Icon(
                            Icons.privacy_tip_rounded,
                            color: Color(kPrimaryBlackColor),
                          ),
                        ),
                        title: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(kPrimaryBlackColor)),
                        ),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: kDefaultIconDarkColor.withOpacity(0.1)),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text("Something went wrong"));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
