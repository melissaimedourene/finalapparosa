import 'package:flutter/material.dart';
import 'package:monapplicationarosaje/login_page.dart';
import 'package:monapplicationarosaje/page1.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'John Doe',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'john.doe@example.com',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.local_florist),
            title: const Text('Liste des plantes'),
            onTap: () {
              // Naviguer vers la liste des plantes de l'utilisateur
              // Implémentez la logique de navigation ici
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Historique des transactions'),
            onTap: () {
              // Naviguer vers l'historique des transactions de l'utilisateur
              // Implémentez la logique de navigation ici
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Paramètres de confidentialité'),
            onTap: () {
              // Naviguer vers les paramètres de confidentialité de l'utilisateur
              // Implémentez la logique de navigation ici
            },
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              // Déconnexion de l'utilisateur
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),


              (Route<dynamic> route) => false,
              );
            },
            child: const Text('Se déconnecter'),
          ),
        ],
      ),
    );
  }
}