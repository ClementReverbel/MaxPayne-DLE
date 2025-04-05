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
    required this.characterOptions,
  });

  @override
  State<AutoCompleteCharacter> createState() => _AutoCompleteCharacterState();
}

class _AutoCompleteCharacterState extends State<AutoCompleteCharacter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return widget.characterOptions.where((String option) {
            return option.toLowerCase().contains(
              textEditingValue.text.toLowerCase(),
            );
          }).toList();
        },

        //Ici on renvoi au widget parent le changement d'état
        onSelected: (String selection) {
          widget.onCharacterSelected(selection);
        },
        fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            onEditingComplete: onEditingComplete,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              hintText: 'Entrez un personnage',
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.indigo),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.indigo),
              ),
            ),
          );
        },
      ),
    );
  }
}
