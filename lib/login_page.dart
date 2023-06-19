import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monapplicationarosaje/delayed_animation.dart';
import 'package:monapplicationarosaje/main.dart';
import 'package:monapplicationarosaje/page1.dart';
import 'package:monapplicationarosaje/social_page.dart';
import 'package:monapplicationarosaje/Singin_page.dart';
import 'package:monapplicationarosaje/message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (EmailValidator.validate(email)) {
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => NavigationExample(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    } else {
      print('Adresse e-mail invalide');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFFFFFFFF),
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
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: DelayedAnimation(
                    delay: 4500,
                    child: Container(
                      decoration: BoxDecoration(
                        color: d_green,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: double.infinity,
                      child: TextFormField(
                        controller: emailController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        onChanged: (value) {
                          if (EmailValidator.validate(value.trim())) {
                            // Adresse e-mail valide
                          } else {
                            print('Adresse e-mail invalide');
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: DelayedAnimation(
                    delay: 4500,
                    child: Container(
                      decoration: BoxDecoration(
                        color: d_green,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: double.infinity,
                      child: TextFormField(
                        controller: passwordController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Mot de passe',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          // Ici vous pouvez stocker la valeur saisie par l'utilisateur dans une variable.
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: DelayedAnimation(
                    delay: 4500,
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: d_green,
                          shape: StadiumBorder(),
                          padding: EdgeInsets.all(26),
                        ),
                        child: Text('Se connecter'),
                        onPressed: () => _login(context),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SinginPage()),
                    );
                  },
                  child: DelayedAnimation(
                    delay: 3500,
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 30,
                        bottom: 20,
                      ),
                      child: Text(
                        "Vous n'avez pas de compte ? S'inscrire",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                        ),
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








