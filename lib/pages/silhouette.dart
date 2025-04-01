import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/elements/boutonsMenu.dart';

import '../class_DB/shape.dart';

class silhouette extends StatefulWidget {
  const silhouette({super.key});

  @override
  State<silhouette> createState() => _silhouetteState();
}

class _silhouetteState extends State<silhouette> {
  //Notre citation choisie aléatoirement
  Shape? _silhouette;
  bool _shape_mode=true;

  //Exécute notre fonction de récupération de carte aléatoire à l'initialisation
  @override
  void initState() {
    super.initState();
    _getRandomSilhouette();
  }

  //Fonction qui récupère une carte aléatoire et la met dans la variable de classe
  //de notre classe
  Future<void> _getRandomSilhouette() async {
    //Permet de choisir parmis nos 7 silhouettes, une aléatoire (peut donc être update si plus de silhouette)
    final int maxId = 7;
    //On prend donc un id aléatoire (le +1 est dû à la méthode nextInt() qui ne prend pas la dernière valeur)
    int randomId = Random().nextInt(maxId)+1;

    //Permet de ne pas avoir 2 fois le même objet d'affilé
    do {
      randomId = Random().nextInt(maxId) + 1;
    } while (_silhouette != null && randomId == _silhouette!.id);

    //On lit l'objet correspondant à l'id
    Shape? silhouette = await Shape.readOne(randomId);

    //Et ici met notre variable de classe à l'objet lu
    setState(() {
      _silhouette = silhouette;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
            Column(
                children:
                [Text("Silhouette", style: TextStyle(fontSize: 40)),
                  //! permet de vérifier si silhouette n'est pas null
                  _shape_mode?
                    Image.asset(_silhouette!.path_shape):
                    Image.asset(_silhouette!.path_full_image),
                  Switch(value: _shape_mode, onChanged: (bool value)=>setState((){
                    _shape_mode = value;
                  }))
                ]
            )
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _getRandomSilhouette();
            },
            child: Icon(Icons.refresh)
        ),
        appBar: const boutonsMenu());
  }
}
