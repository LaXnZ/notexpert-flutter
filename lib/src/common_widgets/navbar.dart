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
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 199, 224, 233),
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue, // Customize the selected item color
      unselectedItemColor: const Color.fromARGB(255, 31, 31, 31),
      showSelectedLabels: false, // Hide labels
      showUnselectedLabels: false,
      iconSize: 29, // Adjust the icon size as needed
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: currentIndex == 0
                ? Colors.blue
                : const Color.fromARGB(255, 31, 31, 31),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: currentIndex == 1
                ? Colors.blue
                : const Color.fromARGB(255, 31, 31, 31),
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: currentIndex == 2
                ? Colors.blue
                : const Color.fromARGB(255, 31, 31, 31),
          ),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: currentIndex == 3
                ? Colors.blue
                : const Color.fromARGB(255, 31, 31, 31),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
