import 'package:flutter/material.dart';
import 'package:fishflutter/screen/fish_market_screen.dart';
import 'package:fishflutter/screen/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              width: 342,
              height: 702,
              decoration: BoxDecoration(
                color: const Color(0xFF88D8E9),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 32.0,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 63),
                    const Text(
                      'SIGN IN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 60),

                    // Username Input
                    Container(
                      height: 67,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9FBFF),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.person_outline,
                            size: 27,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            child: TextField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Username",
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 31),

                    // Password Input
                    Container(
                      height: 67,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9FBFF),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.lock_outline,
                            size: 27,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 31),

                    // Sign In Button
                    ElevatedButton(
                      onPressed: () {
                        // Optional: validasi bisa ditambahkan di sini
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FishMarketScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF16717B),
                        minimumSize: const Size(110, 43),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21.5),
                        ),
                      ),
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),

                    const SizedBox(height: 37),

                    // Sign Up Navigation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Not a Member ?,',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign Up now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
