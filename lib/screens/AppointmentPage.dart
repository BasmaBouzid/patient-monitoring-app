import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';



class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  late DateTime _selectedDate ;
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    print('Firebase is initialized.');
  }

   
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rendez-vous enregistré'),
          content: Text('Votre rendez-vous a été enregistré avec succès.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Color.fromARGB(167, 11, 224, 210),
            height: 80.0,
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Choisissez votre rendez-vous',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 48.0),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: SfCalendar(
                view: CalendarView.month,
                monthViewSettings: MonthViewSettings(showAgenda: true),
                onTap: (CalendarTapDetails details) {
                  setState(() {
                    _selectedDate = details.date!;
                  });
                },
              ),
            ),
          ),
          Container(
            color: Color.fromARGB(167, 11, 224, 210),
            height: 80.0,
            child: Center(
              child: TextButton(
  onPressed: () {
                  if (_selectedDate != null) {
                    // Enregistrement de la date sélectionnée dans Firebase
                    databaseReference
                        .child('appointments')
                        .push()
                        .set({'date': _selectedDate.toString()})
                        .then((value) => _showDialog());
                  }
                },


                child: Text(
                  'Réserve maintenant',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

