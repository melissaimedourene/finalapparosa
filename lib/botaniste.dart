import 'package:flutter/material.dart';
import 'package:monapplicationarosaje/Singin_page.dart';
import 'package:flutter/material.dart';
import 'package:monapplicationarosaje/Singin_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garde de Plantes',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BotanistPage(),
    );
  }
}

class BotanistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interface Botaniste'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Naviguer vers la page de profil du botaniste
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BotanistProfilePage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.mail),
            onPressed: () {
              // Naviguer vers la page de messagerie
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagingPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Naviguer vers la page de notifications
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tableau de bord',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Liste des plantes populaires',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Afficher la liste des plantes populaires
            Expanded(
              child: ListView.builder(
                itemCount: popularPlants.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      popularPlants[index].image,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(popularPlants[index].name),
                    subtitle: Text(popularPlants[index].category),
                    onTap: () {
                      // Naviguer vers la page des détails de la plante
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PlantDetailsPage(plant: popularPlants[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Plant {
  final String name;
  final String category;
  final String image;

  Plant({required this.name, required this.category, required this.image});
}

List<Plant> popularPlants = [
  Plant(
    name: 'Plante 1',
    category: 'Catégorie 1',
    image: 'assets/images/plant1.jpg',
  ),
  Plant(
    name: 'Plante 2',
    category: 'Catégorie 2',
    image: 'assets/images/plant2.jpg',
  ),
  Plant(
    name: 'Plante 3',
    category: 'Catégorie 1',
    image: 'assets/images/plant3.jpg',
  ),
];

class PlantDetailsPage extends StatelessWidget {
  final Plant plant;

  PlantDetailsPage({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.name),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              plant.image,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 16.0),
            Text(
              'Nom: ${plant.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Catégorie: ${plant.category}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'Conseils d\'entretien:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            // Afficher les conseils d'entretien de la plante
          ],
        ),
      ),
    );
  }
}

class BotanistProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil du botaniste'),
      ),
      body: Center(
        child: Text('Contenu de la page du profil du botaniste'),
      ),
    );
  }
}

class MessagingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messagerie'),
      ),
      body: Center(
        child: Text('Contenu de la page de messagerie'),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Text('Contenu de la page des notifications'),
      ),
    );
  }
}