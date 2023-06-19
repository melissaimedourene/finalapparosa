import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monapplicationarosaje/delayed_animation.dart';
import 'package:monapplicationarosaje/main.dart';
import 'package:monapplicationarosaje/login_page.dart';
import 'package:monapplicationarosaje/Singin_page.dart';
class SocialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFF578C49),


      body: SingleChildScrollView(
        child: Column(
          children: [
            DelayedAnimation(
              delay: 1500,
              child: Container(
                height: 280,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            Column(
              children: [
                // première colonne
                Container(
                  // ajouter une marge en bas
                  margin: EdgeInsets.only(bottom: 20),
                  child: DelayedAnimation(
                    delay: 4500,
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: d_green,
                            shape: StadiumBorder(),
                            padding: EdgeInsets.all(13)),
                        child: Text('Se Connecter'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                // deuxième colonne
                Container(
                  // ajouter une marge en haut
                  margin: EdgeInsets.only(top: 20),
                  child: DelayedAnimation(
                    delay: 4500,
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: d_green,
                            shape: StadiumBorder(),
                            padding: EdgeInsets.all(13)),
                        child: Text('S\'inscrire'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SinginPage (),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );

  }
}











