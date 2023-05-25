import 'package:flutter/material.dart';

import 'doctor.dart';



class ChooseDoctorPage extends StatefulWidget {
  const ChooseDoctorPage({Key? key}) : super(key: key);
  @override
  _ChooseDoctorPageState createState() => _ChooseDoctorPageState();
}

class _ChooseDoctorPageState extends State<ChooseDoctorPage> {
  List<Doctor> _doctors = [   
  Doctor(        name: "Dr. Ahmed Hassan",        speciality: "Cardiologist",        photoAsset: "assets/images/doctor1.jpeg"),   
   Doctor(        name: "Dr. Fatima Ali",        speciality: "Dermatologist",        photoAsset: "assets/images/doctor2.jpeg"), 
   Doctor(        name: "Dr. Omar Mohamed",        speciality: "Pediatrician",        photoAsset: "assets/images/doctor3.jpeg"),  
   Doctor(        name: "Dr. Sara Ahmed",        speciality: "Neurologist",        photoAsset: "assets/images/doctor4.jpeg"),   
   Doctor(        name: "Dr. Ali Hassan",        speciality: "Gynecologist",        photoAsset: "assets/images/doctor5.jpeg"),  ];

  Doctor? _selectedDoctor;

  @override
  Widget build(BuildContext context) {  //BuildContext context, qui est un objet qui contient des informations sur l'environnement dans lequel le widget est créé. Le contexte fournit des informations telles que la taille de l'écran, le thème actuel et la localisation.
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            color: Colors.blue[900],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               IconButton(
  icon: Icon(Icons.arrow_back, color: Colors.white),
  onPressed: () {
    Navigator.pop(context);
  },
),

                Text(
                  "Choisissez un médecin",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                SizedBox(width: 40),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Rechercher des médecins",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _doctors.length,
                      itemBuilder: (context, index) {
                        Doctor doctor = _doctors[index];
                        return ListTile(
                          leading: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(doctor.photoAsset),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          title: Text(doctor.name),
                          subtitle: Text(doctor.speciality), //subtitle=soustitre
                          selected: doctor == _selectedDoctor,
                          onTap: () {
                    setState(() {//mettre à jour l'état d'un widget et pour notifier le framework qu'il doit se reconstruire. Lorsque vous appelez setState(), cela déclenche la méthode build() pour le widget en question, ce qui permet de mettre à jour l'interface utilisateur en conséquence.
                    _selectedDoctor = doctor;
                      });
               
                  },

                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                    
                     child: Text("Passer",
                     style: TextStyle( color: const Color.fromARGB(255, 254, 255, 255),
                      ),
                      ),

                      onPressed: () {
                        if (_selectedDoctor != null) {
                          Navigator.pushNamed(context, "/home",
                              arguments: _selectedDoctor);
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Erreur"),
                                content: Text("Veuillez choisir un médecin."),
                                actions: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom( primary: Colors.blue[900], ),
                                    child: Text("OK"),
                                    onPressed:
                                  () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                        primary:  Colors.blue[900],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
}

 //void _onDoctorSelected(Doctor doctor) {
  //setState(() {
 //   _selectedDoctor = doctor;
 // });
  //Navigator.pushNamed(
   // '/doctor chat',
  //  arguments: {'doctorName': doctor.name,
   // 'doctorPhoto': doctor.photoAsset,},
    
 // );
//}

}