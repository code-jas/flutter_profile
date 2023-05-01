import 'package:flutter/material.dart';
import 'package:flutter_profile/screens/home_screen.dart';
// import 'package:flutter_profile/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      // home: const ProfileScreen(),
      home: const HomeScreen(),
    );
  }
}
