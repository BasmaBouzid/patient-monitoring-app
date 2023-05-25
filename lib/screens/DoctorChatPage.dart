import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


import 'dart:async';


class DoctorChatPage extends StatefulWidget {
  @override
  _DoctorChatPageState createState() => _DoctorChatPageState();
}
class _DoctorChatPageState extends State<DoctorChatPage> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];
 late DatabaseReference _messagesRef;
  StreamSubscription<DatabaseEvent>? _messagesSubscription;//pour écouter les mises à jour de la base de données en temps réel et mettre à jour l'état de l'interface utilisateur


  @override
  void initState() {
    super.initState();
    _messagesRef = FirebaseDatabase.instance.reference().child('messages');
    _messagesSubscription = _messagesRef.onChildAdded.listen((event) {   //onchildadded  pour surveiller les nouvelles données ajoutées à une référence
      setState(() {
        _messages.add(event.snapshot.value.toString());
      });
    });
  }
//Cette fonction dispose() est appelée lorsqu'un widget est retiré de l'arborescence des widgets, généralement lorsqu'un écran est fermé ou qu'un widget n'est plus nécessaire.

//Dans ce cas précis, cette fonction annule l'abonnement _messagesSubscription pour éviter les fuites de mémoire potentielles. L'opérateur ? est utilisé ici pour s'assurer que _messagesSubscription est non nul avant de l'annuler, car il est possible qu'aucun abonnement n'ait été créé auparavant. Ensuite, super.dispose() est appelé pour exécuter la fonction dispose() de la superclasse.
  @override
  void dispose() {
    _messagesSubscription?.cancel();
    super.dispose();
  }



//Cette méthode _handleSubmitted est utilisée pour envoyer un nouveau message dans la base de données Firebase. Elle efface le texte du champ de saisie _textController, puis elle utilise la référence _messagesRef pour pousser une nouvelle entrée dans la base de données avec la méthode push(), qui génère une clé unique pour chaque entrée, puis la méthode set() pour stocker le texte du message dans cette entrée. Ainsi, chaque message envoyé par l'utilisateur est stocké en tant qu'objet avec une clé unique dans la base de données Firebase.
  void _handleSubmitted(String text) {
    _textController.clear();
    _messagesRef.push().set(text);
  }

  Widget _buildTextComposer() {
    return IconTheme(  // qui permet de définir le thème d'icônes pour ses enfants.
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),//est utilisé pour créer un thème d'icônes avec la couleur secondaire définie dans le thème global de l'application
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(  //Flexible est un widget dans le framework Flutter qui permet à son enfant de se dimensionner de manière flexible par rapport à l'espace disponible dans un conteneur parent.
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: "Type your message"),//pour créer un champ de saisie minimaliste qui affiche l'invite "Type your message" à l'intérieur de l'espace vide. 
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(
              child: Text('JD'),
            ),
            SizedBox(width: 8.0),
            Text('Dr. John Doe'),
            Spacer(),
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.videocam),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),// pour ajouter un espace uniforme de 8 pixels sur tous les côtés d'un widget
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final reversedIndex = _messages.length - 1 - index; //cela peut être utile pour parcourir une liste dans l'ordre inverse, en commençant par le dernier élément et en remontant vers le début.
                final message = _messages[reversedIndex];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children
                : <Widget>[
                 CircleAvatar(
  child: Icon(Icons.person),
),

                  SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          child: Text(message),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      Divider(height: 1.0),
      Container(
        decoration: BoxDecoration(color: Theme.of(context).cardColor),
        child: _buildTextComposer(),
      ),
    ],
  ),
);
}
}