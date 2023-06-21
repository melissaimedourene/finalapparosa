import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:monapplicationarosaje/camera.dart';
import 'package:monapplicationarosaje/locationmanagerpage.dart';
import 'package:monapplicationarosaje/profile.dart';
import 'package:monapplicationarosaje/Singin_page.dart';
import 'package:monapplicationarosaje/login_page.dart';
import 'package:monapplicationarosaje/message.dart';
import 'package:monapplicationarosaje/main.dart';
import 'package:monapplicationarosaje/maps.dart';
import 'package:camera/camera.dart';
import 'package:monapplicationarosaje/delayed_animation.dart';

class Plant {
  final String name;
  final String category;
  final String image;
  final String careTips;

  Plant({
    required this.name,
    required this.category,
    required this.image,
    required this.careTips,
  });
}

class PlantDetailsPage extends StatelessWidget {
  final Plant plant;

  const PlantDetailsPage({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la plante'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Image.asset(plant.image),
          SizedBox(height: 16.0),
          Text(
            plant.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            plant.category,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16.0),
          Text(
            'Conseils d\'entretien',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            plant.careTips,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class NavigationExample extends StatelessWidget {
  const NavigationExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Naviguer vers la page de profil
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
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
                  builder: (context) => SendMessagePage(),
                ),
              );
            },
          ),
          // IconButton(
          //   icon: Icon(Icons.notification_add),
          //   onPressed: () {
          //     // Naviguer vers la page des notifications
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => NotificationsPage(),
          //       ),
          //     );
          //   },
          // ),
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {
              // Naviguer vers la page de Google Maps
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GoogleMapsPage()),
              );
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // Ajout de la couleur rouge au container
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                'Je prends en photo ma plante',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: d_green, // Couleur verte personnalisée
                    shape: StadiumBorder(),
                    padding: EdgeInsets.all(26),
                  ),
                  onPressed: () {
                    // Déconnexion de l'utilisateur
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => CameraPage()),
                          (Route<dynamic> route) => false,
                    );
                  },
                  child: Text('Prendre en photo'),
                ),

                Text(
                  'Tableau de bord',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Liste des plantes populaires',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlantDetailsPage(
                          plant: popularPlants[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.green,
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
            leading: const Icon(Icons.settings),
            title: const Text('Informations personnelles'), // Modifier le libellé
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InformationPersonnellesPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_florist),
            title: const Text('Liste des plantes'),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Historique des transactions'),
            onTap: () {
              // Naviguer vers l'historique des transactions de l'utilisateur
              // Implémentez la logique de navigation ici
              // Par exemple, vous pouvez utiliser Navigator.push pour naviguer vers la page de l'historique des transactions
            },
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: d_green, // Couleur verte personnalisée
              shape: StadiumBorder(),
              padding: EdgeInsets.all(26),
            ),
            onPressed: () {
              // Déconnexion de l'utilisateur
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false,
              );
            },
            child: Text('Se déconnecter'),
          )
        ],
      ),
    );
  }
}

List<Plant> popularPlants = [
  Plant(
    name: 'Plante 1',
    category: 'Catégorie 1',
    image: 'assets/images/plant1.jpg',
    careTips: 'Conseils pour la plante 1',
  ),
  Plant(
    name: 'Plante 2',
    category: 'Catégorie 2',
    image: 'assets/images/plant2.jpg',
    careTips: 'Conseils pour la plante 2',
  ),
  Plant(
    name: 'Plante 3',
    category: 'Catégorie 1',
    image: 'assets/images/plant3.jpg',
    careTips: 'Conseils pour la plante 3',
  ),
];


class MyNotification {
  final IconData icon;
  final String title;
  final String description;

  MyNotification({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class NotificationsPage extends StatelessWidget {
   NotificationsPage({Key? key}) : super(key: key);

  // Exemple de liste de notifications
  final List<MyNotification> notifications = [
    MyNotification(
      icon: Icons.notifications,
      title: 'Notification 1',
      description: 'Description de la notification 1',
    ),
    MyNotification(
      icon: Icons.notifications,
      title: 'Notification 2',
      description: 'Description de la notification 2',
    ),
    MyNotification(
      icon: Icons.notifications,
      title: 'Notification 3',
      description: 'Description de la notification 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: Icon(notification.icon),
            title: Text(notification.title),
            subtitle: Text(notification.description),
            onTap: () {
              // Naviguer vers la page de détails de la notification
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationDetailsPage(notification: notification),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class NotificationDetailsPage extends StatelessWidget {
  final MyNotification notification;

  NotificationDetailsPage({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la notification'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.white, // Ajout de la couleur d'arrière-plan blanche
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(notification.icon),
            SizedBox(height: 16.0),
            Text(
              notification.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              notification.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: NavigationExample(),
    );
  }
}


class InformationPersonnellesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informations personnelles'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nom',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Prénom',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nom d\'utilisateur',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Numéro de Téléphone',
              ),
            ),
            // Ajoutez d'autres champs de formulaire selon vos besoins

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: d_green, // Couleur verte personnalisée
                shape: StadiumBorder(),
                padding: EdgeInsets.all(26),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => NavigationExample()),
                      (Route<dynamic> route) => false,
                );
                // Ajoutez ici la logique pour enregistrer les informations personnelles
              },
              child: Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}


