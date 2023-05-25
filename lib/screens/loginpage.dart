import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'ChooseDoctorPage.dart';
import 'forgot-password-page.dart';

import 'package:firebase_database/firebase_database.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  
 late String _email;
   late String _password;
     final FirebaseAuth _auth = FirebaseAuth.instance;
      
   

bool isValidEmail(String email) {
    //  Implement email validation
    return email.contains('@gmail.com');
  }
   bool isValidPassword(String password) {
    //  Implement password validation
    return password.length >= 6;
  }
  Widget _title() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 5),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Center(
    child:Text('Connexion',
    
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),textAlign: TextAlign.center,),),
              SizedBox(
                height: 15,
              ),
             Center(
    child: Text('Remplissez le formulaire pour vous connecter', 
      textAlign: TextAlign.center)
  ),
            ]));
  }

  

  Widget _inputmail() {
    return Container(
      child: TextFormField(
        decoration:
            InputDecoration(labelText: 'Email', hintText: 'entrer votre email'),
        validator: (String? value) {
                      if (value != null && value.isEmpty) {
                         return 'Entrer votre email s"il vous plait';
                         } else if (value != null && !isValidEmail(value)) {
                        return 'Entrer un email valide s"il vous plait';
                      }
                       return null;
                    },
        onSaved: (value) {
          _email = value ?? "";
        },
      ),
    );
  }

  Widget _passdevider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20), //marge vertivale//. La marge est définie comme étant symétrique, ce qui signifie que la même valeur est utilisée pour le haut et le bas de la marge
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextFormField(
            obscureText: _obscureText,
            decoration: InputDecoration(
                labelText: 'mot de passe', hintText: 'entrer votre mot de passe',),
            validator: (value) {
              if (value != null &&  value.isEmpty) {
                return 'Entrer votre mot de passe s"il vous plait';
                 } else if (value != null && !isValidPassword(value)) {
                        return 'Entrer un mot de passe valide s"il vous plait';
              }
              return null;
            },
            onSaved: (value) {
              _password = value ??"";
            },
          )),
          
        ],
      ),
    );
  }

   Widget _forgotpass(BuildContext context) {
  return GestureDetector(
    child: Align(
      alignment: Alignment.centerLeft,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.fromLTRB(00, 20, 20, 20),
        child: Text(
          'Mot de passe oublié?',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      )
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => forgot()),
      );
    },
  );
}
Widget _inputsubmit1() {
  return Container(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();

          try {
            // Utiliser l'authentification Firebase pour connecter l'utilisateur
            final UserCredential userCredential =
                await _auth.signInWithEmailAndPassword(
              email: _email,
              password: _password,
            );

            // Enregistrer l'heure de connexion de l'utilisateur dans Realtime Database
           DatabaseReference userRef = FirebaseDatabase.instance.reference().child('users').child(userCredential.user!.uid);
userRef.child('last_login').set(DateTime.now().toIso8601String());


            // Si l'utilisateur est connecté avec succès, rediriger vers la page d'accueil
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChooseDoctorPage()),
            );
          } on FirebaseAuthException catch (e) {
        // Afficher un snackbar pour indiquer l'erreur d'authentification
       
        if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
        content: Text('Aucun utilisateur ne correspond à cet e-mail.'),
        backgroundColor: Color.fromARGB(255, 222, 9, 9),
        duration: Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        action: SnackBarAction(
          label: '',
          textColor: Color.fromARGB(255, 255, 255, 255),
          onPressed: () {},
        ),
      ),
        );}else if (e.code == 'wrong-password') {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Le mot de passe est incorrect.'),
        backgroundColor: Color.fromARGB(255, 222, 9, 9),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        action: SnackBarAction(
          label: '',
          textColor: const Color.fromARGB(255, 254, 253, 253),
          onPressed: () {},
        ),
      ),
    );
  }
      } catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(e.toString()),
      backgroundColor: Color.fromARGB(255, 222, 9, 9),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      action: SnackBarAction(
        label: '',
        textColor: const Color.fromARGB(255, 255, 253, 253),
        onPressed: () {},
      ),
    ),
  );
}







        }
      },
      child: Text('Connexion'),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.blue[900]!),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    ),
  );
}

  


  


Widget _textregister(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('pas encore de compte?'),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.transparent,
            child: Text(
              'Inscrire',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => register()),
            );
          },
        )
      ],
    ),
  );
}


@override
Widget build(BuildContext context) {
return Scaffold(
body: SafeArea(
child: SingleChildScrollView(
child: Container(
margin: EdgeInsets.only(top: 50),
child: Column(
children: <Widget>[
  SizedBox(height: 50),
_title(),
SizedBox(height: 30),
Container(
margin: EdgeInsets.symmetric(horizontal: 30),
child: Form(
key: _formKey,
child: Column(
children: <Widget>[

SizedBox(height: 2),
_inputmail(),
SizedBox(height: 2),
_passdevider(),
_forgotpass(context),
_inputsubmit1(),


],
),
),
),
SizedBox(height: 2),

_textregister(context)
],
),
),
),
),
);
}
}



















class register extends StatefulWidget {

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  late String _name;
 late String _email;
   late String _password;
    
   
  String _confirmPassword = '';
bool isValidEmail(String email) {
    // TODO: Implement email validation
    return email.contains('@gmail.com');
  }
   bool isValidPassword(String password) {
    // TODO: Implement password validation
    return password.length >= 6;
  }
  Widget _title() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 5),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             Center(child: Text('Inscrire',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),
              SizedBox(
                height: 15,
              ),
              Center(
    child: Text('Remplissez le formulaire pour vous inscrire', 
      textAlign: TextAlign.center)
  ),
            ]));
  }

  Widget _inputname() {
    return Container(
      child: TextFormField(
        decoration:
            InputDecoration(labelText: 'Nom', hintText: 'entrer votre nom'),
        validator: (value) {
          if (value != null && value.isEmpty) {
            return 'S"il vous plaît entrez votre nom';
          }
          return null;
        },
        onSaved: (value) {
          _name = value ?? "";
        },
      ),
    );
  }

  Widget _inputmail() {
    return Container(
      child: TextFormField(
        decoration:
            InputDecoration(labelText: 'Email', hintText: 'entrer votre email'),
        validator: (String? value) {
                      if (value != null && value.isEmpty) {
                         return 'Veuillez saisir votre e-mail';
                         } else if (value != null && !isValidEmail(value)) {
                        return 'Veuillez entrer un email valide';
                      }
                       return null;
                    },
        onSaved: (value) {
          _email = value ?? "";
        },
      ),
    );
  }

  Widget _passdevider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextFormField(
            obscureText: _obscureText,
            decoration: InputDecoration(
                labelText: 'mot de passe', hintText: 'entrer votre mot de passe',),
            validator: (value) {
              if (value != null &&  value.isEmpty) {
                return 'Veuillez saisir votre mot de passe';
              }
              return null;
            },
            onSaved: (value) {
              _password = value ??"";
            },
          )),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: TextFormField(
            obscureText: _obscureText,
            decoration: InputDecoration(
                labelText: 'confirmer votre mot de passe',hintText: ''),
            validator: (value) {
              if (value != null &&  value.isEmpty) {
                return 'Veuillez confirmer votre mot de passe';
              }
              return null;
            },
            onSaved: (value) {
              // Do nothing since we are only using this for validation
               _confirmPassword = value ??"";
            },
          )),
        ],
      ),
    );
  }


final FirebaseAuth _auth = FirebaseAuth.instance;

Widget _inputsubmit() {
  return Container(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState != null && _formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          
          if (_password != _confirmPassword) {
            // Show an error message if passwords do not match
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Les mots de passe ne correspondent pas"),
               backgroundColor: Color.fromARGB(255, 222, 9, 9),
            ));
          } else {
            try {
              // Create user account in Firebase Authentication
              UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                email: _email,
                password: _password,
              );

              // Navigate to ChooseDoctorPage
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseDoctorPage()));
            } catch (e) {
              // Show an error message if account creation fails
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(e.toString()),
                 backgroundColor: Color.fromARGB(255, 222, 9, 9),
              ));
            }
          }
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[900]!),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      child: Text('Inscrire'),
    ),
  );
}


Widget _textlogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('déjà un compte?'),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.transparent,
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        )
      ],
    ),
  );
}



   
@override
Widget build(BuildContext context) {
return Scaffold(
body: SafeArea(
child: SingleChildScrollView(
child: Container(
margin: EdgeInsets.only(top: 50),
child: Column(
children: <Widget>[
  SizedBox(height: 20),
_title(),
SizedBox(height: 30),
Container(
margin: EdgeInsets.symmetric(horizontal: 30),
child: Form(
key: _formKey,
child: Column(
children: <Widget>[
_inputname(),
SizedBox(height: 30),
_inputmail(),
SizedBox(height: 30),
_passdevider(),
SizedBox(height: 30),
_inputsubmit(),


],
),
),
),
_textlogin(context)

],
),
),
),
),
);
}
}