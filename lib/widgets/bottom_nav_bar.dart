import 'package:flutter/material.dart';
import 'package:fishflutter/screen/chat_screen.dart';
import 'package:fishflutter/screen/fish_market_screen.dart';
import 'package:fishflutter/screen/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const FishMarketScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ChatScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: const Color(0xFFF3EDF7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.home_outlined,
              size: 33,
              color: currentIndex == 0 ? Colors.blue : Colors.black,
            ),
            onPressed: () => _onItemTapped(context, 0),
          ),
          IconButton(
            icon: Icon(
              Icons.chat_bubble_outline,
              size: 33,
              color: currentIndex == 1 ? Colors.blue : Colors.black,
            ),
            onPressed: () => _onItemTapped(context, 1),
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
              size: 33,
              color: currentIndex == 2 ? Colors.blue : Colors.black,
            ),
            onPressed: () => _onItemTapped(context, 2),
          ),
        ],
      ),
    );
  }
}
