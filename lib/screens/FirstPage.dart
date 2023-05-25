import 'package:flutter/material.dart';
import 'loginpage.dart'; // importez la page de connexion

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/image médicale.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bienvenue sur l'application de surveillance de patients à distance !",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
             
              onPressed: () {
                // Naviguez vers la page de connexion
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text("Commencer"),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

