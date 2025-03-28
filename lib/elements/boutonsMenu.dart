import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/main.dart';
import '../pages/citation.dart';
import '../pages/map.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum burger { theme, apropos }

class boutonsMenu extends StatefulWidget implements PreferredSizeWidget {
  const boutonsMenu({super.key});

  @override
  State<boutonsMenu> createState() => _boutonsMenuState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _boutonsMenuState extends State<boutonsMenu> {
  bool _switchon = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => citation()),
            );
          },
          icon: const Icon(Icons.assistant),
          label: Text(
            AppLocalizations.of(context)!.citation,
            style: const TextStyle(color: Colors.black),
          ),
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
          label: Text(
            AppLocalizations.of(context)!.carte,
            style: TextStyle(color: Colors.black),
          ),
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
          label: Text(
            AppLocalizations.of(context)!.silhouette,
            style: TextStyle(color: Colors.black),
          ),
          iconAlignment: IconAlignment.start,
        ),
        PopupMenuButton(
          itemBuilder:
              (BuildContext context) => <PopupMenuEntry<burger>>[
                const PopupMenuItem<burger>(
                  value: burger.apropos,
                  child: Text("A propos"),
                ),
                PopupMenuItem<burger>(
                  value: burger.theme,
                  child: Switch(
                    value: _switchon,
                    onChanged: (bool value) {
                      setState(() {
                        _switchon = value;
                      });
                    },
                  ),
                ),
              ],
        ),
      ],
    );
  }
}
