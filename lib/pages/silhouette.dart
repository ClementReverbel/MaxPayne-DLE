import 'dart:math';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/elements/boutonsMenu.dart';
import 'package:maxpaynedle/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../class_DB/shape.dart';
import '../elements/AutoCompleteCharacter.dart';
import '../elements/ScoreProvider.dart';

class silhouette extends StatefulWidget {
  const silhouette({super.key});

  @override
  State<silhouette> createState() => _silhouetteState();
}

class _silhouetteState extends State<silhouette> {
  //Notre silhouette choisie aléatoirement
  Shape? _silhouette;
  bool _shape_mode = true;
  String _selectedCharacter = "";

  //Ici se trouve les items qui peuvent être proposés
  final List<String> characters = <String>[
    'Alfred Woden',
    'Anthony DeMarco',
    'Max Payne',
    'Mona Sax',
    'Nicole Horne',
    'Raul Passos',
    'Tony DeMarco',
  ];

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
    int randomId = Random().nextInt(maxId) + 1;

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

  String gamemodeText(BuildContext context) {
    return _shape_mode ? AppLocalizations.of(context)!.mode_jeu(AppLocalizations.of(context)!.silhouette_mode_on) :
    AppLocalizations.of(context)!.mode_jeu(AppLocalizations.of(context)!.silhouette_mode_off);
  }

  @override
  Widget build(BuildContext context) {
    if (_silhouette == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: const boutonsMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.silhouette, style: const TextStyle(fontSize: 40)),
            _shape_mode
                ?
                //Affiche l'image en fonction du mode de jeu
                Image.asset(_silhouette!.path_shape)
                : Image.asset(_silhouette!.path_full_image),
            const SizedBox(height: 20),
            Text(gamemodeText(context)),
            Switch(
              value: _shape_mode,
              onChanged:
                  (bool value) => setState(() {
                    _shape_mode = value;
                  }),
            ),
            //Quand l'enfant est modifié alors on change l'état de notre personnage choisi
            AutoCompleteCharacter(
              onCharacterSelected: (String selected) {
                setState(() {
                  _selectedCharacter = selected;
                });
              },
              characterOptions: characters,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String result = "";
                if (_selectedCharacter == _silhouette!.character) {
                  _getRandomSilhouette();
                  context.read<ScoreProvider>().augmenterScore();
                  result = AppLocalizations.of(context)!.gagne(_selectedCharacter);
                } else {
                  result = "Ce n'est pas le bon personnage. Réessayez !";
                }
                final snackBar = SnackBar(
                  content: Text(result),
                  action: SnackBarAction(
                    label: AppLocalizations.of(context)!.retirer,
                    onPressed: () {
                      // Action d'annulation (facultative)
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text(AppLocalizations.of(context)!.valider),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getRandomSilhouette();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

