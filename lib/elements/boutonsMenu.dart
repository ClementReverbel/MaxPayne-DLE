import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/main.dart';
import '../pages/citation.dart';
import '../pages/map.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class boutonsMenu {
  static List<Widget> build(BuildContext context) {
    return <Widget>[
      TextButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => citation()),
          );
        },
        icon: const Icon(Icons.assistant),
        label: Text(AppLocalizations.of(context)!.citation, style: const TextStyle(color: Colors.black)),
        iconAlignment: IconAlignment.start,
      ),
      TextButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => findMap()),
          );
        },
        icon: const Icon(Icons.map),
        label: Text(AppLocalizations.of(context)!.carte, style: TextStyle(color: Colors.black)),
        iconAlignment: IconAlignment.start,
      ),
      TextButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => citation()),
          );
        },
        icon: const Icon(Icons.account_box),
        label: Text(AppLocalizations.of(context)!.silhouette, style: TextStyle(color: Colors.black)),
        iconAlignment: IconAlignment.start,
      ),
    ];
  }
}
