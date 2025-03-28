import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/elements/boutonsMenu.dart';
import 'package:maxpaynedle/pages/citation.dart';
import 'package:maxpaynedle/pages/map.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class acceuil extends StatelessWidget {
  const acceuil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.titre_accueil),
        actions: boutonsMenu.build(context),
      ),
      body: Center(
        child: Text("Les infos en question", style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
