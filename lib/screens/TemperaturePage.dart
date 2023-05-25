import 'package:flutter/material.dart';





class TemperaturePage extends StatelessWidget {
  const TemperaturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height:200,
              color: Color(0xFFC96D27),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Température corporelle',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Color(0xFFEFEFEF),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Janvier 2023',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        SizedBox(height: 8),
                        Text(
                          'Plage de valeur: 38°C/38.5°C',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Evaluation d"état: Elevé',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Color(0xFFEFEFEF),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Février 2023',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        SizedBox(height: 8),
                        Text(
                          'Plage de valeur: 37°C/39°C',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Evaluation d"état: Critique',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Color(0xFFEFEFEF),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mars 2023',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        SizedBox(height: 8),
                        Text(
                          'Plage de valeur: 34°C/35.5°C',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Evaluation d"état: Bas',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Color(0xFFEFEFEF),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         ' Avril 2023',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        SizedBox(height: 8),
                        Text(
                          'Plage de valeur: 36°C/37°C',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Evaluation d"état: normale',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Color(0xFFEFEFEF),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mai 2023',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        SizedBox(height: 8),
                        Text(
                          'Plage de valeur: 36°C/37°C',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Evaluation d"état: normale',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Color(0xFFEFEFEF),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Juin 2023',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        SizedBox(height: 8),
                        Text(
                          'Plage de valeur: 36°C/37°C',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Evaluation d"état: normale',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Color(0xFFEFEFEF),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Juillet 2023',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        SizedBox(height: 8),
                        Text(
                          'Plage de valeur: 36°C/37°C',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Evaluation d"état: normale',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Color(0xFFEFEFEF),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aout 2023',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        SizedBox(height: 8),
                        Text(
                          'plage de valeur: 36°C/37°C',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Evaluation d"état: normale',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Color(0xFFEFEFEF),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Septembre 2023',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        SizedBox(height: 8),
                        Text(
                          'Plage de valeur: 36°C/37°C',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Evaluation d"état: normale',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Color(0xFFEFEFEF),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Octobre 2023',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        SizedBox(height: 8),
                        Text(
                          'Plage de valeur: 36°C/37°C',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Evaluation d"état: normale',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Color(0xFFEFEFEF),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Novembre 2023',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        SizedBox(height: 8),
                        Text(
                          'plage de valeur: 36°C/37°C',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Evaluation d"état: normale',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Color(0xFFEFEFEF),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Décembre 2023',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Divider(),
                        SizedBox(height: 8),
                        Text(
                          'Plage de valeur: 36°C/37°C',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Evaluation d"état: Normal',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                   
                  // Ajouter d'autres éléments de la liste ici...
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
