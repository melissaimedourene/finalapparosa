import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monapplicationarosaje/delayed_animation.dart';
import 'package:monapplicationarosaje/main.dart';
import 'package:monapplicationarosaje/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:monapplicationarosaje/Singin_page.dart';
import 'package:monapplicationarosaje/page1.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SinginPage extends StatefulWidget {
  @override
  _SinginPage createState() => _SinginPage();
}

class _SinginPage extends State<SinginPage> {
  //final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  @override
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Première colonne
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: DelayedAnimation(
                      delay: 4500,
                      child: Container(
                        decoration: BoxDecoration(
                          color: d_green, // Couleur de fond de la colonne
                          borderRadius: BorderRadius.circular(30), // Forme arrondie de la colonne
                        ),
                        width: double.infinity,
                        child: Semantics(
                          label: "Saisissez votre nom",
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.white, // Couleur du texte dans le champ de saisie
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Nom',
                              labelStyle: TextStyle(color: Colors.white), // Couleur de l'étiquette
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none, // Enlève la bordure du champ de saisie
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              prefixIcon: Icon(Icons.person_outline, color: Colors.white), // Icône descriptive pour le champ de saisie
                            ),
                            //onChanged: (value) {
                            // Ici vous pouvez stocker la valeur saisie par l'utilisateur dans une variable.

                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Deuxième colonne
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: DelayedAnimation(
                      delay: 4500,
                      child: Container(
                        decoration: BoxDecoration(
                          color: d_green, // Couleur de fond de la colonne
                          borderRadius: BorderRadius.circular(30), // Forme arrondie de la colonne
                        ),
                        width: double.infinity,
                        child: Semantics(
                          label: "Saisissez votre prénom",
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.white, // Couleur du texte dans le champ de saisie
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Prénom',
                              labelStyle: TextStyle(color: Colors.white), // Couleur de l'étiquette
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none, // Enlève la bordure du champ de saisie
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              prefixIcon: Icon(Icons.person_outline, color: Colors.white), // Icône descriptive pour le champ de saisie
                            ),
                            //onChanged: (value) {
                            // Ici vous pouvez stocker la valeur saisie par l'utilisateur dans une variable.

                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // deuxième colonne
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: DelayedAnimation(
                delay: 4500,
                child: Container(
                  decoration: BoxDecoration(
                    color: d_green, // Couleur de fond de la colonne
                    borderRadius: BorderRadius.circular(30), // Forme arrondie de la colonne
                  ),
                  width: double.infinity,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white, // Couleur du texte dans le champ de saisie
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white), // Couleur de l'étiquette
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // Enlève la bordure du champ de saisie
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    //validator: (value) =>
                    //value!.isEmpty ? 'Email ne peut être vide': null,
                    onChanged: (value) => setState(() => _email = value),
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
                    color: d_green, // Couleur de fond de la colonne
                    borderRadius: BorderRadius.circular(30), // Forme arrondie de la colonne
                  ),
                  width: double.infinity,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white, // Couleur du texte dans le champ de saisie
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Numéro de téléphone',
                      labelStyle: TextStyle(color: Colors.white), // Couleur de l'étiquette
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // Enlève la bordure du champ de saisie
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    //onChanged: (value) {
                    // Ici vous pouvez stocker la valeur saisie par l'utilisateur dans une variable.

                  ),
                ),
              ),
            ),



            // deuxième colonne
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: DelayedAnimation(
                delay: 4500,
                child: Container(
                  decoration: BoxDecoration(
                    color: d_green, // Couleur de fond de la colonne
                    borderRadius: BorderRadius.circular(30), // Forme arrondie de la colonne
                  ),
                  width: double.infinity,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white, // Couleur du texte dans le champ de saisie
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Mot de passe',
                      labelStyle: TextStyle(color: Colors.white), // Couleur de l'étiquette
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // Enlève la bordure du champ de saisie
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    //validator: (value) =>
                    //value!.isEmpty ? 'Le mot de Passe ne peut pas être vide' : null,
                    obscureText: true,
                    onChanged: (value) => setState(() => _password = value),
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
                    color: d_green, // Couleur de fond de la colonne
                    borderRadius: BorderRadius.circular(30), // Forme arrondie de la colonne
                  ),
                  width: double.infinity,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white, // Couleur du texte dans le champ de saisie
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Confirmer le mot de passe',
                      labelStyle: TextStyle(color: Colors.white), // Couleur de l'étiquette
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // Enlève la bordure du champ de saisie
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    obscureText: true,
                    /*onChanged: (value) {
                          // Ici vous pouvez stocker la valeur saisie par l'utilisateur dans une variable.
                        },*/
                  ),
                ),
              ),
            ),
            // troisieme colonne
            Container(
              // ajouter une marge en haut
              margin: EdgeInsets.only(top: 30),
              child: DelayedAnimation(
                delay: 4500,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: d_green,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.all(26)),
                    child: Text('S\'inscrire'),
                    onPressed: _register,
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                // Naviguer vers la page de connexion ici
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
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
                    "Vous avez déjà un compte ? Se connecter",
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


      ),
    );
  }
  void _register() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: _email, password: _password);
    /*
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        // TODO: Add any additional actions you want to perform upon successful account creation
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }*/
  }
}
