import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _adressController;
  late TextEditingController _PhoneController;

  // Initialisez une instance de la base de données
  final DatabaseReference _profileRef = FirebaseDatabase.instance.reference().child('profiles');

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _adressController = TextEditingController();
    _PhoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editer le  Profil'),
      ),
      body: SingleChildScrollView( //SingleChildScrollView permettra à l'utilisateur de faire défiler les conteneurs pour voir les contenus qui dépassent la taille de l'écran.
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre nom';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre adresse e-mail';
                    } else if (!value.contains('@gmail.com')) {
                      return 'Veuillez entrer une adresse e-mail valide';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _adressController,
                  decoration: InputDecoration(
                    labelText: 'Adresse',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre adresse';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _PhoneController,
                  decoration: InputDecoration(
                    labelText: 'Téléphone',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre numéro de téléphone';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Sauvegarder les données dans la base de données
                      _profileRef.child(FirebaseAuth.instance.currentUser!.uid).set({
                        'name': _usernameController.text,
                        'email': _emailController.text,
                        'adress': _adressController.text,
                        'phone': _PhoneController.text,
                      }).then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Changements enregistrés avec succès')),
                        );
                      }).catchError((error) {
                       
// Afficher une erreur si la sauvegarde échoue
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text('Une erreur est survenue lors de la sauvegarde')),
);
});
}
},
child: Text('Enregistrer'),
),
],
),
),
),
),
);
}


}
