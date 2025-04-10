import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import 'sign_in_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 46),

                    // Profile Image
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://cdn.builder.io/api/v1/image/assets/TEMP/77086b33de79ebaf37857435ea19bee3bf67fa10?placeholderIfAbsent=true',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Name & Email
                    const Text(
                      'Nama',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF101010),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'akun@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Color(0xFF878787),
                      ),
                    ),
                    const SizedBox(height: 64),

                    // Stats
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 37),
                      child: Column(
                        children: const [
                          StatsBox(text: 'TOTAL ORDER ='),
                          SizedBox(height: 20),
                          StatsBox(text: 'PENDING ORDER ='),
                          SizedBox(height: 20),
                          StatsBox(text: 'ORDER BATAL ='),
                        ],
                      ),
                    ),
                    const SizedBox(height: 64),

                    // Sign Out Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 42),
                      child: Container(
                        width: double.infinity,
                        height: 52,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD6D6D6)),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Implement sign out functionality here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInScreen(),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout, color: Color(0xFFF14141)),
                              SizedBox(width: 8),
                              Text(
                                'Sign Out',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFF14141),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            BottomNavBar(currentIndex: 2),
// Sama seperti di halaman FishMarketScreen
          ],
        ),
      ),
    );
  }
}

class StatsBox extends StatelessWidget {
  final String text;

  const StatsBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0x8C88D8E9),
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }
}
