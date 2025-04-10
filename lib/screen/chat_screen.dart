import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Pesan',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ChatItem(
            name: 'Lapak Pak Hadi',
            message: 'Mujair masih ada, Bu.',
            time: '08.30',
          ),
          ChatItem(
            name: 'Lapak Pak Roni',
            message: 'Ikan tongkol segar baru datang.',
            time: 'Kemarin',
          ),
          ChatItem(
            name: 'Lapak Bu Sari',
            message: 'Mau dikirim jam berapa, ya?',
            time: 'Senin',
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;

  const ChatItem({
    Key? key,
    required this.name,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xFFB4ECF9),
          child: Icon(Icons.storefront, color: Colors.white),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          message,
          style: const TextStyle(fontFamily: 'Inter'),
        ),
        trailing: Text(
          time,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        onTap: () {
          // Aksi ketika chat di-tap
        },
      ),
    );
  }
}
