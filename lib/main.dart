import 'package:flutter/material.dart';
import 'package:monapplicationarosaje/social_page.dart';
import 'package:monapplicationarosaje/login_page.dart';
import 'package:monapplicationarosaje/maps.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:monapplicationarosaje/welcome_page.dart';

const d_green = Color(0xFF3A672E);

void main() async {
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
