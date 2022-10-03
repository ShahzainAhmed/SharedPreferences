import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practiceflutter/home_screen.dart';
import 'package:practiceflutter/login_screen.dart';
import 'package:practiceflutter/student_screen.dart';
import 'package:practiceflutter/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // first this initState function will run, then the splash screen will build
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    debugPrint('run');
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';

    if (isLogin) {
      if (userType == 'student') {
        Timer(
          const Duration(seconds: 3),
          () {
            // to go the different page use Navigator.push()
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StudentScreen()),
            );
          },
        );
      } else if (userType == 'teacher') {
        Timer(
          const Duration(seconds: 3),
          () {
            // to go the different page use Navigator.push()
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TeacherScreen()),
            );
          },
        );
      } else {
        Timer(const Duration(seconds: 3), () {
          // to go the different page use Navigator.push()
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        });
      }
    } else {
      Timer(const Duration(seconds: 3), () {
        // to go the different page use Navigator.push()
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Image(
          height: double.infinity,
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              "https://images.pexels.com/photos/1633525/pexels-photo-1633525.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
        ),
      ),
    );
  }
}
