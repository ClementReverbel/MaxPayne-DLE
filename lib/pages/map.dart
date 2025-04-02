import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/class_DB/location.dart';
import 'package:maxpaynedle/elements/boutonsMenu.dart';


List<String?> _allLoc = [ "ballation" , "canal", "departure","favela", "palace", "subway", "shoot" ];

class findMap extends StatefulWidget {
  const findMap({super.key});

  @override
  State<findMap> createState() => _findMapState();
}

class _findMapState extends State<findMap> {
  //Notre carte choisie aléatoirement
  Location? _location;
  String _location_choosen = "55th Ballation HQ";



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
                  //! permet de vérifier si location n'est pas null
                  Image.asset(_location!.path),
                  Column(
                    children: <Widget>[
                      ListTile(
                        title: const Text('55th Ballation HQ'),
                        leading: Radio<String>(
                          value: "55th Ballation HQ",
                          groupValue: _location_choosen,
                          onChanged: (String? value) {
                            setState(() {
                              _location_choosen = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Canal de Panama'),
                        leading: Radio<String>(
                          value: "Canal de Panama",
                          groupValue: _location_choosen,
                          onChanged: (String? value) {
                            setState(() {
                              _location_choosen = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Departure Lounge'),
                        leading: Radio<String>(
                          value: "Departure Lounge",
                          groupValue: _location_choosen,
                          onChanged: (String? value) {
                            setState(() {
                              _location_choosen = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Favela Heights'),
                        leading: Radio<String>(
                          value: "Favela Heights",
                          groupValue: _location_choosen,
                          onChanged: (String? value) {
                            setState(() {
                              _location_choosen = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Imperial palace'),
                        leading: Radio<String>(
                          value: "Imperial palace",
                          groupValue: _location_choosen,
                          onChanged: (String? value) {
                            setState(() {
                              _location_choosen = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Roscoe street subway'),
                        leading: Radio<String>(
                          value: "Roscoe street subway",
                          groupValue: _location_choosen,
                          onChanged: (String? value) {
                            setState(() {
                              _location_choosen = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Shoot first'),
                        leading: Radio<String>(
                          value: "Shoot first",
                          groupValue: _location_choosen,
                          onChanged: (String? value) {
                            setState(() {
                              _location_choosen = value!;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  TextButton(onPressed: ()=>{
                    if(_location?.place == _location_choosen){
                      print("OUI")
                    } else{
                      print("NON")
        }

                  }, child: Text("Valider"))
                ]
            )
        ),
        appBar: const boutonsMenu());
  }
}
