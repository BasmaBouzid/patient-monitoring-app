
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';




class forgot extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  Widget _title() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Mot de passe oublié ?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 3,
              ),
              Text('entrez votre email et nous '
                  ' vous enverrai un lien pour réinitialiser votre mot de passe ')
            ]));
  }

  Widget _inputmail() {
    return Container(
      child: TextField(
        decoration: InputDecoration(hintText: 'Email'),
        controller: _emailController, // Define the controller here
      ),
    );
  }

  Widget _inputsubmit(context) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(50),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            FirebaseAuth auth = FirebaseAuth.instance;
            try {
              await auth.sendPasswordResetEmail(email: _emailController.text);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('E-mail de réinitialisation du mot de passe envoyé !'),
                backgroundColor: Color.fromARGB(255, 222, 9, 9),
                  action: SnackBarAction(
          label: '',
          textColor: Color.fromARGB(255, 255, 255, 255),
          onPressed: () {},
        ),
              ));
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Error sending password reset email.'),
                backgroundColor: Color.fromARGB(255, 222, 9, 9),
             
                action: SnackBarAction(
          label: '',
          textColor: Color.fromARGB(255, 255, 255, 255),
          onPressed: () {},
        ),
               ), );
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          child: Text('send'),
        ),
      ),
    ],
  );
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'forgot password page',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(60),
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[_title(), _inputmail(), _inputsubmit(context)],
            ),
          ),
        ),
      ),
    );
  }
}






































































