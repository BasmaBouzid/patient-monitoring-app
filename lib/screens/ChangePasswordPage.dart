import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  String _oldPassword = '';
  String _newPassword = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Changer le mot de passe'),
      ),
      body: Padding(  //le padding est utilisé pour ajouter de l'espace vide autour d'un widget(notre widget ici est formulaire)
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,//"_formKey" est une clé unique qui est utilisée pour identifier le formulaire. La clé est créée en dehors de la méthode build() de la classe et est ensuite passée au formulaire en tant que paramètre key. De cette façon, si le formulaire doit être mis à jour, Flutter peut le faire sans avoir à recharger tout l'arbre des widgets.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Ancien mot de passe',
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Veuillez saisir votre ancien mot de passe';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _oldPassword = value;
                    });
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Nouveau mot de passe',
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Veuillez saisir un nouveau mot de passe';
                    }
                    if (value != null && value.length < 6) {
                      return 'Le mot de passe doit contenir au moins 6 caractères';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _newPassword = value;
                    });
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirmer le nouveau mot de passe',
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Veuillez confirmer le nouveau mot de passe';
                    }
                    if (value != _newPassword) {
                      return 'Les mots de passe ne correspondent pas';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _confirmPassword = value;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: enregistrer le nouveau mot de passe
                        }
                      },
                      child: Text('Enregistrer'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


