import 'package:flutter/material.dart';
import 'package:mon_app/screens/TemperaturePage.dart';
class SuiviPage extends StatelessWidget {
  const SuiviPage({Key? key}) : super(key: key);//SuiviPage utilise super(key: key) pour appeler le constructeur de la classe parente (StatelessWidget). La variable key est un identifiant unique pour ce widget, 

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
                          'Données de suivi',
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
            GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TemperaturePage()),
    );
  },
         child:Container(
              
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
                      Text(
                        'Température corporelle',
                        style: TextStyle(
                          color: Colors.red[900],
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                     
                    ],
                  ),
                ],
              ),
            ),
        ),
            SizedBox(height: 15.0),
            GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TemperaturePage()),
    );
  },
            child:Container(
              
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
                      Text(
                        'Pression artérielle',
                        style: TextStyle(
                          color: Colors.red[900],
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      
                   ],
                  ),
                ],
              ),
            ),
        ),
             SizedBox(height: 15.0),
              GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TemperaturePage()),
    );
  },
           child: Container(
              
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
                      Text(
                        'Fréquence cardiaque',
                        style: TextStyle(
                          color: Colors.red[900],
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                     ],
                  ),
                ],
              ),
            ),
        ),
            SizedBox(height: 15.0),
             GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TemperaturePage()),
    );
  },
         child:   Container(
              
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
                      Text(
                        'Saturation en oxygène',
                        style: TextStyle(
                          color: Colors.red[900],
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                     ],
                  ),
                ],
              ),
            ),
        ),



         SizedBox(height: 15.0),
             GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TemperaturePage()),
    );
  },
         child:   Container(
              
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
                      Text(
                        'Fréquence respiratoire',
                        style: TextStyle(
                          color: Colors.red[900],
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                     ],
                  ),
                ],
              ),
            ),
        ),
         SizedBox(height: 15.0),
             GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TemperaturePage()),
    );
  },
         child:   Container(
              
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
                      Text(
                        'Fraction inspirée oxygène',
                        style: TextStyle(
                          color: Colors.red[900],
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                     ],
                  ),
                ],
              ),
            ),
        ),
          ],
        ),
      ),] ),
     ), );
  }
}
