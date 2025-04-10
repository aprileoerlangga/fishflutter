import 'package:flutter/material.dart';
import 'package:fishflutter/screen/notification_screen.dart';
import 'package:fishflutter/screen/cart_screen.dart'; // 

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      color: const Color(0xFF88D8E9),
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18.5,
            backgroundImage: NetworkImage(
              'https://cdn.builder.io/api/v1/image/assets/TEMP/e1331ad941180fed65b4ea5a603ef292262b0cb5',
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Search Bar
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  child: Container(
                    width: 259,
                    height: 24,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD1D1D6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, size: 10, color: Colors.black),
                        SizedBox(width: 12),
                        Text(
                          'SEARCH',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),

                // Notifikasi
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ),
                    );
                  },
                  child: const Icon(Icons.notifications_none, color: Colors.black),
                ),
                const SizedBox(width: 20),

                // 🛒 Cart dengan navigasi
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                  child: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
