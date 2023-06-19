import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monapplicationarosaje/social_page.dart';
import 'package:monapplicationarosaje/delayed_animation.dart';
import 'package:monapplicationarosaje/main.dart';
import 'package:monapplicationarosaje/social_page.dart';


class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                ),
                child: Text(
                  "Bienvenue sur",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 40,
                  ),
                ),
              ),
              // Affichage de l'image du logo
              Container(
                height: 170,
                child: Image.asset('assets/images/logo.png'),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: d_green,
                    shape: StadiumBorder(),
                    padding: EdgeInsets.all(26),
                  ),
                  child: Text(
                    'Je commence',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SocialPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







