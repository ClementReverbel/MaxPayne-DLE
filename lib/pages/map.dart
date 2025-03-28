import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/class_DB/location.dart';
import 'package:maxpaynedle/elements/boutonsMenu.dart';

class findMap extends StatefulWidget {
  const findMap({super.key});

  @override
  State<findMap> createState() => _findMapState();
}

class _findMapState extends State<findMap> {
  //Notre carte choisie aléatoirement
  Location? _location;

  //Exécute notre fonction de récupération de carte aléatoire à l'initialisation
  @override
  void initState() {
    super.initState();
    _getRandomLocation();
  }

  //Fonction qui récupère une carte aléatoire et la met dans la variable de classe
  //de notre classe
  Future<void> _getRandomLocation() async {
    //Permet de choisir parmis nos 7 cartes une aléatoire (peut donc être update si plus de map)
    final int maxId = 7;
    //On prend donc un id aléatoire (le +1 est dû à la méthode nextInt() qui ne prend pas la dernière valeur)
    int randomId = Random().nextInt(maxId)+1;
    //On lit l'objet correspondant à l'id
    Location? location = await Location.readOne(randomId);

    //Et ici met notre variable de classe à l'objet lu
    setState(() {
      _location = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
            Column(
                children:
                [Text("Map", style: TextStyle(fontSize: 40)),
                  //! permet de vérifier si location n'est pas nul
                  Image.asset(_location!.path)
                ]
            )
        ),
        appBar: const boutonsMenu());
  }
}
