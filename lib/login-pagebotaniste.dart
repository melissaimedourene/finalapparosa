import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monapplicationarosaje/delayed_animation.dart';
import 'package:monapplicationarosaje/main.dart';
import 'package:monapplicationarosaje/Socialebotaniste.dart';
import 'package:monapplicationarosaje/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:monapplicationarosaje/botaniste.dart';
import 'package:monapplicationarosaje/signin_pagebotaniste.dart';

class BotanistLoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print('Botanist ${userCredential.user!.uid} logged in');

      // Naviguer vers la page appropriée pour le botaniste ici
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BotanistPage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No botanist found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that botanist.');
      }
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
                        onChanged: (value) {},
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
                        onChanged: (value) {},
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
                      MaterialPageRoute(builder: (context) => SinginBotanistePage()),
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
