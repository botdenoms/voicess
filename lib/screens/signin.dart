import 'package:flutter/material.dart';

import 'package:voicess/screens/screens.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF496d60),
        elevation: 0.0,
        leading: GestureDetector(
          child: Container(
            height: 28.0,
            width: 28.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100.0,
                  width: double.infinity,
                  child: Center(
                    child: CircleAvatar(backgroundColor: Colors.white),
                  ),
                ),
                const Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
                const TextField(
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF496d60),
                  ),
                  decoration: InputDecoration(
                    hintText: '+245712345678',
                    hintStyle: TextStyle(
                      color: Color(0xFF496d60),
                      fontSize: 18.0,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 10.0),
                const TextField(
                  obscureText: true,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF496d60),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Color(0xFF496d60),
                      fontSize: 18.0,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 40.0),
                Center(
                  child: GestureDetector(
                    child: Container(
                      height: 40.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xFF3A534A),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const ProfileScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF496d60),
    );
  }
}
