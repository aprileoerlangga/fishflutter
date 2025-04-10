import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              // Header
              Container(
                color: const Color(0xFF88D8E9),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Tombol Kembali
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back, color: Colors.black),
                        ),
                        const SizedBox(width: 12),
                        // Avatar atau ikon kecil
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: const Color(0xFFEDEDED),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.network(
                              'https://via.placeholder.com/24',
                              width: 20,
                              height: 20,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.image_not_supported),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Notification',
                      style: TextStyle(
                        color: Color(0xFF101010),
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 36), // Spacer kanan
                  ],
                ),
              ),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Hari Ini
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 35),
                            const Text(
                              'Hari ini',
                              style: TextStyle(
                                color: Color(0xFF878787),
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            NotificationItem(
                              imageUrl: 'https://via.placeholder.com/48',
                              title: 'Pesanan telah diantar',
                              subtitle: '01-04-2025 09.27',
                            ),
                            const Divider(color: Color(0xFFEDEDED), height: 32),
                            NotificationItem(
                              imageUrl: 'https://via.placeholder.com/48',
                              title: 'Order dibatalkan',
                              subtitle: '19-03-2025 19.30',
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 76),
                      Container(height: 4, color: const Color(0xFFEDEDED)),

                      // Kemarin
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 52),
                            const Text(
                              'Kemarin',
                              style: TextStyle(
                                color: Color(0xFF878787),
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            NotificationItem(
                              imageUrl: 'https://via.placeholder.com/48',
                              title: 'Penyiapan Akun Berhasil!',
                              subtitle: 'Promosi khusus hanya berlaku hari ini',
                            ),
                            const Divider(color: Color(0xFFEDEDED), height: 32),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const NotificationItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          imageUrl,
          width: 48,
          height: 48,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.image_not_supported, size: 48),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF101010),
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFF878787),
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
