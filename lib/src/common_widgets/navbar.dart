import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return BottomNavigationBar(
      backgroundColor: isDark
          ? Color.fromARGB(255, 67, 67, 67)
          : const Color.fromARGB(255, 199, 224, 233),
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: const Color.fromARGB(255, 31, 31, 31),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 29,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: currentIndex == 0
                ? isDark
                    ? Color.fromRGBO(132, 95, 238, 25)
                    : Colors.blue
                : isDark
                    ? const Color.fromRGBO(172, 172, 172, 25)
                    : const Color.fromARGB(255, 31, 31, 31),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: currentIndex == 1
                ? isDark
                    ? Color.fromRGBO(132, 95, 238, 25)
                    : Colors.blue
                : isDark
                    ? const Color.fromRGBO(172, 172, 172, 25)
                    : const Color.fromARGB(255, 31, 31, 31),
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: currentIndex == 2
                ? isDark
                    ? Color.fromRGBO(132, 95, 238, 25)
                    : Colors.blue
                : isDark
                    ? const Color.fromRGBO(172, 172, 172, 25)
                    : const Color.fromARGB(255, 31, 31, 31),
          ),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: currentIndex == 3
                ? isDark
                    ? Color.fromRGBO(132, 95, 238, 25)
                    : Colors.blue
                : isDark
                    ? const Color.fromRGBO(172, 172, 172, 25)
                    : const Color.fromARGB(255, 31, 31, 31),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
