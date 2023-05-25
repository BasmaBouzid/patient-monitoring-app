import 'package:flutter/material.dart';
import 'package:mon_app/screens/MedicationPage.dart';
import 'package:mon_app/screens/SuiviPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mon_app/screens/ChangePasswordPage.dart';
import 'package:mon_app/screens/EditProfilePage.dart';
import 'package:mon_app/screens/DoctorChatPage.dart';
import 'package:mon_app/screens/AppointmentPage.dart';
import 'loginpage.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'VitalSignsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeWidget(),
    ProfileWidget(),
    AlertWidget(),
    SettingWidget(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
         currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
           
            icon: Icon(Icons.home),
            label:'Accueil',
         ),   
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
             label:'Profil',),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
             label:'Alerte' ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label:'Paramètres',
          ),
        ],
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110,
          decoration: BoxDecoration(
            color: Colors.blue[900],
          ),
          child: Center(
            child: Text(
              'Bonjour',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
         decoration:BoxDecoration( borderRadius:BorderRadius.only(topLeft:Radius.circular(40),),),
          child:Column(
            children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MedicationPage()),
    );
  },
          child:  Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 19, 175, 172),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.medication,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Médicament',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ),
            InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AppointmentPage()),
    );
  },
          child:  Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(167, 11, 224, 210),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.schedule,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Rendez-vous',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SuiviPage()),
   );
  },
            child:Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(209, 180, 39, 39),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.data_usage,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Données de suivi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ),
            InkWell(
              onTap: () {
               Navigator.push(
                 context,
                MaterialPageRoute(builder: (context) => DoctorChatPage()),
                );
              },
          child:  Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 103, 20, 150),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chat,
                size: 50,
              ),
              SizedBox(height: 10),
              Text(
                'Chat',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
            ),
      ],
    ),
    SizedBox(height: 10),
   InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VitalSignsPage()),
    );
  },
  child: Container(
    width: 150,
    height: 150,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 245, 23, 23),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.favorite,
          size: 50,
        ),
        SizedBox(height: 10),
        Text(
          'Signes vitaux',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
  ),
  
  ],
          ),
        ),
      ],
         
    );
}
}



class ProfileWidget extends StatefulWidget {
  @override
  _PatientProfilePageState createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<ProfileWidget> {
 late TextEditingController _nameController;
   late TextEditingController _emailController;
  late  TextEditingController _phoneController;
   late TextEditingController _ageController;
   late TextEditingController _genderController;
   late TextEditingController _adressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(); //créé un controleur
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _ageController = TextEditingController();
    _genderController = TextEditingController();
    _adressController= TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil patient'),
      ),
      body: SingleChildScrollView(   // Il permet donc d'afficher du contenu qui ne tient pas dans l'écran et d'y accéder facilement en scrollant.
        child: Column(
          children: [
            Container(
  height: 250,
  width: 250,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    image: DecorationImage(
      fit: BoxFit.cover,   //image est mise à l'échelle pour remplir complètement le conteneur sans déformation
      image: NetworkImage(
        'https://picsum.photos/200',
      ),
    ),
  ),
  child: GestureDetector(
    onTap: () async {
 // final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
  //if (pickedFile != null) {
  //  // Si une image a été sélectionnée, affichez-la dans le conteneur
  //  setState(() {
   //   _image = File(pickedFile.path);
  //  });
  //}
},

    
  ),
),

            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _adressController,
                decoration: InputDecoration(
                  labelText: 'Adresse',
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Téléphone',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'Âge',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _genderController,
                decoration: InputDecoration(
                  labelText: 'Genre',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Récupérer les nouvelles valeurs des champs
                String name = _nameController.text;
              String email = _emailController.text;
              String phone = _phoneController.text;
              String adress = _adressController.text;
             int age = int.parse(_ageController.text);
             String gender = _genderController.text;

               // Enregistrer les modifications du profil du patient
              saveProfileChanges(name, email,adress, phone, age, gender);
              },
              child: Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
  
 void saveProfileChanges(String name, String email, String adress, String phone, int age, String gender) async {
  try {
    final DatabaseReference userRef = FirebaseDatabase.instance.reference().child('patients/${FirebaseAuth.instance.currentUser!.uid}');
    await userRef.update({
      'name': name,
      'email': email,
      'adress': adress,
      'phone': phone,
      'age': age,
      'gender': gender,
    });
    // Afficher un message de succès
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Modifications enregistrées avec succès')));
  } catch (e) {
    // Afficher un message d'erreur
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur lors de l\'enregistrement des modifications')));
  }
}


}







class AlertWidget extends StatefulWidget {
  @override
  _AlertWidgetState createState() => _AlertWidgetState();
}

class _AlertWidgetState extends State<AlertWidget> {
  
// Les données de suivi en temps réel
  double glycemiaLevel = 0.0;
  double bloodPressure = 0.0;
  double heartRate = 0.0;

  // Définition des seuils pour déclencher les alertes
  double highGlycemiaThreshold = 150.0;
  double lowGlycemiaThreshold = 70.0;
  double highBloodPressureThreshold = 140.0;
  double lowBloodPressureThreshold = 90.0;
  double highHeartRateThreshold = 100.0;
  double lowHeartRateThreshold = 60.0;

  // Liste des alertes
  List<String> alerts = [];

  // Fonction pour ajouter une alerte à la liste
  void addAlert(String alert) {
    setState(() {
      alerts.add(alert);
    });
  }

  // Fonction pour vérifier les valeurs de suivi et déclencher les alertes si nécessaire
  void checkAlerts() {
    if (glycemiaLevel > highGlycemiaThreshold) {
      addAlert('Niveau de glycémie élevé!');
    } else if (glycemiaLevel < lowGlycemiaThreshold) {
      addAlert('Niveau de glycémie bas!');
    }

    if (bloodPressure > highBloodPressureThreshold) {
      addAlert('Pression artérielle élevée!');
    } else if (bloodPressure < lowBloodPressureThreshold) {
      addAlert('Pression artérielle basse!');
    }

    if (heartRate > highHeartRateThreshold) {
      addAlert('Fréquence cardiaque élevée!');
    } else if (heartRate < lowHeartRateThreshold) {
      addAlert('Fréquence cardiaque basse!');
    }
  }

  // Fonction pour simuler des données de suivi en temps réel
  void simulateData() {
    // Ici, vous pouvez utiliser des données réelles provenant de capteurs ou d'autres sources.
    // Pour cet exemple, nous allons simplement utiliser des valeurs aléatoires.
    setState(() {
      glycemiaLevel = 70 + (170 - 70) * new DateTime.now().millisecondsSinceEpoch % 1000 / 1000;
      bloodPressure = 80 + (200 - 80) * new DateTime.now().millisecondsSinceEpoch % 1000 / 1000;
      heartRate = 40 + (140 - 40) * new DateTime.now().millisecondsSinceEpoch % 1000 / 1000;

      // Vérifier les alertes
      checkAlerts();
    });
  }

  @override
  void initState() {
    super.initState();

    // Lancer la simulation des données de suivi en temps réel toutes les 5 secondes
    new Timer.periodic(Duration(seconds: 5), (timer) {
      simulateData();
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Alertes de santé'),
    ),
    body: ListView.builder(
      itemCount: alerts.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(Icons.warning), // Add icons or images for each type of alert
          title: Text(alerts[index]),
        );
      },
    ),
  );
}

}

  















class SettingWidget extends StatefulWidget {
  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notifications push'),
                Switch(
                  value: _isSwitched,
                  onChanged: (value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                ),
              ],
            ),
            Divider(),
            Text(
              'Compte',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 8.0),
            ListTile(
              title: Text('Editer le profil'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Edit Profile page
                Navigator.push(
                context,
                 MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
            ),
            ListTile(
              title: Text('Changer mot de passe'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Change Password page
                Navigator.push(
                context,
                 MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                );
              },
            ),
           ListTile(
  title: Text('Deconnexion'),
  trailing: Icon(Icons.arrow_forward_ios),
  onTap: () async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      print('Error logging out: $e');
    }
  },
),

          ],
        ),
      ),
    );
  }
}
