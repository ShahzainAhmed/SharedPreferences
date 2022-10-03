// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:practiceflutter/home_screen.dart';
import 'package:practiceflutter/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Sign Up"),
        centerTitle: true,
        automaticallyImplyLeading: false, // removes back button logo
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(hintText: "Age"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () async {
                // Shared Preferences to store the value
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());

                // usertypes: admin, student, teacher
                sp.setString('userType', 'teacher'); // sets the userType

                sp.setBool("isLogin", true);

                if (sp.getString('userType') == 'teacher') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentScreen(),
                    ),
                  );
                } else if (sp.getString('userType') == 'student') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentScreen(),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentScreen(),
                    ),
                  );
                }

                // sp.remove("name");

                // print(sp.getInt("age").toString());
                // print(sp.getString("name"));
                // print(sp.getBool("isLogin"));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                width: double.infinity,
                child: const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> shahzainAhmed() async {}
