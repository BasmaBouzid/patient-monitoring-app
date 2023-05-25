import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../screens/loginpage.dart';

import 'screens/MedicationPage.dart';
import '../screens/DoctorChatPage.dart';
import '../screens/SuiviPage.dart';
import '../screens/HomePage.dart';
import '../screens/ChooseDoctorPage.dart';
import '../screens/FirstPage.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
 runApp(MyApp());
}
//void main(){runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remote Patient Monitoring App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/first',
      routes: {
        
        '/first': (context) => FirstPage(),
        '/home': (context) => HomePage(),
        //'/login': (context) => LoginPage(),
   
                                        
        //'/medicationSchedule': (context) => MedicationPage(),
        //'/doctor chat': (context) => DoctorChatPage(),
        
       // '/suivi': (context) => SuiviPage(),
       // '/choosedoctor': (context) => ChooseDoctorPage(),
       
      },
    );
  }
}

