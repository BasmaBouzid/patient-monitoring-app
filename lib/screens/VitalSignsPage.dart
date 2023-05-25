import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:mon_app/screens/TemperaturePage.dart';


import 'package:firebase_database/firebase_database.dart';


class VitalSignsPage extends StatefulWidget {
  @override
  _VitalSignsPageState createState() => _VitalSignsPageState();
}

class _VitalSignsPageState extends State<VitalSignsPage> {
  final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp();
  final databaseReference = FirebaseDatabase.instance.reference();
  String temperature = '0';
  String fraction_inspire ='0';
  String frequence_cardiaque ='0';
  String frequence_respiratoire ='0';
  String pression_arterielle ='0';
  String saturation_oxygene ='0';
  @override
  void initState() {
    super.initState();
    initializeFirebase();
    databaseReference.child('vitalsigns/temperature').onValue.listen((event) {
      setState(() {
        temperature = event.snapshot.value.toString();//snapshot fait référence à un instantané de données récupérées à partir de la base de données Firebase
      });
    });
     databaseReference.child('vitalsigns/fraction_inspire').onValue.listen((event) {
      setState(() {
        fraction_inspire = event.snapshot.value.toString();
      });
    });
    databaseReference.child('vitalsigns/frequence_cardiaque').onValue.listen((event) {
      setState(() {
        frequence_cardiaque = event.snapshot.value.toString();
      });
    });
    databaseReference.child(' vitalsigns/frequence_respiratoire').onValue.listen((event) {
      setState(() {
         frequence_respiratoire = event.snapshot.value.toString();
      });
    });
    databaseReference.child('vitalsigns/pression_arterielle').onValue.listen((event) {
      setState(() {
        pression_arterielle = event.snapshot.value.toString();
      });
    });
    databaseReference.child('vitalsigns/saturation_oxygene').onValue.listen((event) {
      setState(() {
        saturation_oxygene = event.snapshot.value.toString();
      });
    });
  }

  Future<void> initializeFirebase() async {
    await _firebaseInitialization;
    print('Firebase is initialized.');
  }


    @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[900]!, Colors.blue[200]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 35.0),
            
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Vital Signs',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            
            SizedBox(height: 25.0),
            Expanded(
           child:ListView(
  padding: EdgeInsets.all(16.0),
  children: [ 
            Container(
              
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                

              ),
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
              'assets/images/statistique.png',
              height: 90.0,
              width: 50.0,
            ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      'Température corporelle: ',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      '$temperature °C',
      style: TextStyle(
        color: Colors.red[900],
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),

                      
                     
                    ],
                  ),
                ],
              ),
            ),
        
            SizedBox(height: 15.0),
           Container(
              
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
              'assets/images/blood.jpeg',
              height: 90.0,
              width:50.0,
            ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      'Pression artérielle: ',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      '$pression_arterielle mmHg',
      style: TextStyle(
        color: Colors.red[900],
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),

                      
                      
                   ],
                  ),
                ],
              ),
            ),
       
             SizedBox(height: 15.0),
              Container(
              
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
              'assets/images/heart.jpeg',
              height: 90.0,
              width: 50.0,
            ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      'Frequence cardiaque: ',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      '$frequence_cardiaque bpm',
      style: TextStyle(
        color: Colors.red[900],
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),

                      
                     ],
                  ),
                ],
              ),
            ),
        
            SizedBox(height: 15.0),
               Container(
              
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
              'assets/images/blood.jpeg',
              height: 90.0,
              width: 50.0,
            ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      'Saturation en oxygène: ',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      '$saturation_oxygene %',
      style: TextStyle(
        color: Colors.red[900],
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),

                      
                     ],
                  ),
                ],
              ),
            ),
       



         SizedBox(height: 15.0),
            
           Container(
              
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
              'assets/images/frequence.jpg',
              height: 90.0,
              width:50.0,
            ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      'Fréquence respiratoire: ',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      '$frequence_respiratoire rpm ',
      style: TextStyle(
        color: Colors.red[900],
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),

                      
                     ],
                  ),
                ],
              ),
            ),
        
         SizedBox(height: 15.0),
               Container(
              
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
              'assets/images/blood.jpeg',
              height: 90.0,
              width: 50.0,
            ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      'Fraction inspirée oxygène: ',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      '$fraction_inspire %',
      style: TextStyle(
        color: Colors.red[900],
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),

                      
                     ],
                  ),
                ],
              ),
            ),
       
          ],
        ),
      ),] ),
     ), );
  }
}
