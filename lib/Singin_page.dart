import 'package:google_fonts/google_fonts.dart';
import 'package:monapplicationarosaje/delayed_animation.dart';
import 'package:monapplicationarosaje/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:monapplicationarosaje/page1.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
class SinginPage extends StatefulWidget {
  @override
  _SinginPageState createState() => _SinginPageState();
}

class _SinginPageState extends State<SinginPage> {
  late String _email, _password;
  bool _termsAccepted = false;

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
                    onChanged:  (value) {
                      if (EmailValidator.validate(value)) {
                        setState(() => _email = value);
                      } else {
                        // Gérez l'erreur de format d'e-mail invalide
                        // Par exemple, affichez un message d'erreur ou désactivez le bouton de soumission
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
                    color: d_green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: double.infinity,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Confirmer le mot de passe',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    obscureText: true,
                  ),
                ),
              ),
            ),
            // Checkbox for accepting terms and conditions
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: DelayedAnimation(
                delay: 4500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _termsAccepted,
                      onChanged: (value) {
                        setState(() {
                          _termsAccepted = value!;
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        // Show terms and conditions page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TermsAndConditionsPage(),
                          ),
                        );
                      },
                      child: Text(
                        "J'ai lu et j'accepte les conditions d'utilisation",
                        style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
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
                    child: Text('S\'inscrire'),
                    onPressed: () => _register(context),

                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
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
                      color: Colors.black,
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

  void _register(BuildContext context) async {
    String email = _email;
    String password = _password;

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Inscription réussie, effectuez les actions nécessaires ici

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavigationExample())

      ) as Route<Object?>;
    } catch (e) {
      // Gérez les erreurs d'inscription ici
      print('Erreur d\'inscription: $e');
      // Affichez un message d'erreur à l'utilisateur si nécessaire
    }
  }

}

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conditions d'utilisation"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Conditions d'utilisation",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Le respect des droits des personnes et la sécurisation des données :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "La protection des données personnelles est une priorité absolue pour notre entreprise. Conformément aux dispositions de la loi en vigueur, nous avons mis en place des mesures de sécurité rigoureuses pour protéger les données personnelles contre tout accès non autorisé et toute utilisation abusive.",
              ),
              SizedBox(height: 16),
              Text(
                "Traitement transparent et respect des droits des utilisateurs :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Nous nous engageons à traiter les données personnelles de manière transparente, légale et équitable. L'utilisateur dispose des droits suivants concernant ses données personnelles : droit d'accès, de rectification, d'effacement et de portabilité. Ils peuvent également s'opposer à leur traitement ou demander leur limitation.",
              ),
              SizedBox(height: 16),
              Text(
                "Communication et délai de réponse :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "L'entreprise s'engage à répondre dans un délai de 7 jours ouvrés à toutes les demandes des utilisateurs, notamment celles liées à la consultation ou à la suppression des données, réalisées par courriel. Une adresse e-mail est mise à disposition dans notre application pour faciliter la communication avec nos utilisateurs.",
              ),
              SizedBox(height: 16),
              Text(
                "Finalité du traitement des données :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "La finalité de chaque traitement de données peut être transmise par le DPO (Délégué à la Protection des Données), qui est le responsable du traitement des données. L'utilisateur reconnaît que ses données sont la propriété de l'entreprise et que, sauf demande de suppression, la finalité de toutes ses données est d'identifier ses plantes afin que nos botanistes puissent leur prodiguer des conseils. De plus, cela permet aux botanistes à proximité de garder une trace de leurs plantes. Concernant le botaniste, ses données ont pour finalité la vérification de son identité et de sa qualification, afin de lui donner la possibilité de transmettre son savoir et de garder des plantes.",
              ),
              SizedBox(height: 16),
              Text(
                "Droit d'accès et conservation des données :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Bien que l'utilisateur conserve le droit d'accéder à ses données, l'entreprise se réserve le droit de refuser une demande qualifiée de 'd'abusive' en raison de sa formulation ou de sa fréquence. En cas de demande de modification, l'entreprise se réserve le droit de conserver une copie antérieure des données.",
              ),
              SizedBox(height: 16),
              Text(
                "Mesures de sécurité :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Pour garantir la sécurisation des données des utilisateurs, nous avons mis en place les mesures suivantes :",
              ),
              Text(
                "- Respect de la réglementation européenne en matière de protection des données personnelles.",
              ),
              Text(
                "- Utilisation de comptes utilisateurs avec des droits d'accès appropriés pour assurer la confidentialité des informations.",
              ),
              Text(
                "- Mise en place d'un système d'authentification des utilisateurs pour empêcher tout accès non autorisé.",
              ),
              Text(
                "- Stockage sécurisé des données personnelles afin d'éviter les fuites ou les intrusions.",
              ),
              SizedBox(height: 16),
              Text(
                "Durée de conservation des données :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Les données collectées seront utilisées pendant toute la période d'utilisation de l'application par l'utilisateur et seront conservées pendant une durée d'un an après la suppression du compte de l'utilisateur.",
              ),
              SizedBox(height: 16),
              Text(
                "En acceptant ces conditions, vous confirmez votre accord avec notre politique de confidentialité, clairement formulée et facilement accessible sur l'application. Veuillez noter que vous devrez confirmer votre accord avec ces conditions avant que nous puissions collecter ou traiter vos données.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}





