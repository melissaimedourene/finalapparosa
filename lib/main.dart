import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'package:monapplicationarosaje/social_page.dart';
import 'package:monapplicationarosaje/login_page.dart';
import 'package:monapplicationarosaje/maps.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: constant_identifier_names
const d_green = const Color(0xFF3A672E);
void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A-rosa-je',
      home: WelcomePage(),
    );
  }
}
