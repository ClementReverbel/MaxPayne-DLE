import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/class_DB/location.dart';
import 'package:maxpaynedle/elements/boutonsMenu.dart';
import 'package:maxpaynedle/main.dart';
import 'package:maxpaynedle/pages/accueil.dart';
import 'package:provider/provider.dart';

import '../elements/ScoreProvider.dart';
import '../elements/boutonsMenu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<String?> _allLoc = [
  "ballation",
  "canal",
  "departure",
  "favela",
  "palace",
  "subway",
  "shoot",
];

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
    int randomId = Random().nextInt(maxId) + 1;

    //Permet de ne pas avoir 2 fois le même objet d'affilé
    do {
      randomId = Random().nextInt(maxId) + 1;
    } while (_location != null && randomId == _location!.id);

    //On lit l'objet correspondant à l'id
    Location? location = await Location.readOne(randomId);

    //Et ici met notre variable de classe à l'objet lu
    setState(() {
      _location = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_location == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: const boutonsMenu(),
      // Widget OrientationBuilder permet de construire un widget en fonction de l'orientation de l'écran.
      body: OrientationBuilder(
        builder: (context, orientation) {
          //builder est une fonction qui prend en paramètre le context et l'orientation.
          if (orientation == Orientation.portrait) {
            return _buildPortraitLayout();
          } else {
            return _buildLandscapeLayout();
          }
        },
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        //! permet de vérifier si location n'est pas null
        Image.asset(_location!.path),
        Expanded(child: _listRadio()),
        _boutonValider(),
      ],
    );
  }

  Widget _buildPortraitLayout() {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.carte,
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),
            //! permet de vérifier si location n'est pas null
            Image.asset(_location!.path),
            _listRadio(),
            _boutonValider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getRandomLocation();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _listRadio() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 300,
          child: ListView(
            shrinkWrap: true,
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
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _boutonValider() {
    return ElevatedButton(
      onPressed: () {
        String result = "";
        if (_location?.place == _location_choosen) {
          _getRandomLocation();
          result = AppLocalizations.of(context)!.gagne_map(_location_choosen);
        } else {
          result = AppLocalizations.of(context)!.perdu_map;
        }
        final snackBar = SnackBar(
          content: Text(result),
          action: SnackBarAction(
            label: AppLocalizations.of(context)!.retirer,
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Text(AppLocalizations.of(context)!.valider),
    );
  }
}
