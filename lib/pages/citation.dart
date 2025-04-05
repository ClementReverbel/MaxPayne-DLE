import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/elements/boutonsMenu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../class_DB/quote.dart';
import '../elements/AutoCompleteCharacter.dart';

class citation extends StatefulWidget {
  const citation({super.key});

  @override
  State<citation> createState() => _citationState();
}

class _citationState extends State<citation> {
  //Notre citation choisie aléatoirement
  Quote? _citation;
  String _selectedCharacter="";
  final List<String> characters = <String>[
    'Vlad Lem',
    'Jack Lupino',
    'Max Payne',
    'Mona Sax',
    'Detective Winterson',
    'Raul Passos',
  ];

  //Exécute notre fonction de récupération de carte aléatoire à l'initialisation
  @override
  void initState() {
    super.initState();
    _getRandomCitation();
  }

  //Fonction qui récupère une carte aléatoire et la met dans la variable de classe
  //de notre classe
  Future<void> _getRandomCitation() async {
    //Permet de choisir parmis nos 15 citations, une aléatoire (peut donc être update si plus de citations)
    final int maxId = 15;
    //On prend donc un id aléatoire (le +1 est dû à la méthode nextInt() qui ne prend pas la dernière valeur)
    int randomId = Random().nextInt(maxId)+1;

    //Permet de ne pas avoir 2 fois le même objet d'affilé
    do {
      randomId = Random().nextInt(maxId) + 1;
    } while (_citation != null && randomId == _citation!.id);

    //On lit l'objet correspondant à l'id
    Quote? citation = await Quote.readOne(randomId);

    //Et ici met notre variable de classe à l'objet lu
    setState(() {
      _citation = citation;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_citation == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
        body: Center(
            child:
                Column(children: [
                  Text(AppLocalizations.of(context)!.citation, style: TextStyle(fontSize: 40)),
                  Text(_citation!.quote, textAlign: TextAlign.center, style: TextStyle(fontSize:20)),
                  SizedBox(height: 20),
                  AutoCompleteCharacter(
                    onCharacterSelected: (String selected) {
                      setState(() {
                        _selectedCharacter = selected;
                      });
                    }, characterOptions: characters,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String result = "";
                      if (_selectedCharacter == _citation!.character) {
                        _getRandomCitation();
                        result =AppLocalizations.of(context)!.gagne(_selectedCharacter);
                      } else {
                        result = AppLocalizations.of(context)!.perdu;
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
                  ),
                ],
                ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _getRandomCitation();
            },
            child: Icon(Icons.refresh)
        ),
        appBar: const boutonsMenu());
  }
}
