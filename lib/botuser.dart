import 'package:flutter/material.dart';
import 'package:monapplicationarosaje/Socialebotaniste.dart';
import 'package:monapplicationarosaje/social_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inscription',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatelessWidget {
  void navigateToBotanistPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>SocialPage()),
    );
  }

  void navigateToUserInterface(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SocialPagebotaniste()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      navigateToBotanistPage(context);
                    },
                    child: Text('Botaniste'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      navigateToUserInterface(context);
                    },
                    child: Text('Utilisateur'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BotanistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interface Botaniste'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text('Contenu de l\'interface Botaniste'),
        ),
      ),
    );
  }
}

class UserInterfacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interface Utilisateur'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text('Contenu de l\'interface Utilisateur'),
        ),
      ),
    );
  }
}
