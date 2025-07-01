import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF007AFF),
      unselectedItemColor: Colors.grey,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "استكشاف"),
        BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: "رحلاتي"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "بحث"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "حسابي"),
      ],
    );
  }
}
Widget buildBottomNavBar(BuildContext context, int currentIndex) {
  return AppBottomNavBar(
    currentIndex: currentIndex,
    onTap: (index) {
      if (index == currentIndex) return;
      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(context, '/cars');
          break;
        case 1:
          Navigator.pushReplacementNamed(context, '/myTrips');
          break;
        case 2:
          Navigator.pushReplacementNamed(context, '/search');
          break;
        case 3:
          Navigator.pushReplacementNamed(context, '/profile');
          break;
      }
    },
  );
}
