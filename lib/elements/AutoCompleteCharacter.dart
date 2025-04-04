
//Cette classe permet de créer un textField autocomplétant personnalisé
//Il est crée dans une autre classe pour rentre le code propre et réfactorisé
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoCompleteCharacter extends StatefulWidget {
  final Function(String) onCharacterSelected;
  final List<String> characterOptions;

  //On crée une function à passer en paramètre pour la rétroactiver dans le widget parent
  const AutoCompleteCharacter({
    super.key,
    required this.onCharacterSelected,
    required this.characterOptions
  });

  @override
  State<AutoCompleteCharacter> createState() => _AutoCompleteCharacterState();

}

class _AutoCompleteCharacterState extends State<AutoCompleteCharacter> {
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return widget.characterOptions.where((String option) {
          return option.contains(textEditingValue.text);
        });
      },
      //Ici on renvoi au widget parent le changement d'état
      onSelected: (String selection) {
        widget.onCharacterSelected(selection);
      },
    );
  }
}