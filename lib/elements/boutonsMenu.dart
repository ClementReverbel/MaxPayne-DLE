import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/main.dart';
import '../pages/citation.dart';
import '../pages/map.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../pages/silhouette.dart';

enum burger { theme, apropos }

class boutonsMenu extends StatefulWidget implements PreferredSizeWidget {
  const boutonsMenu({super.key});

  @override
  State<boutonsMenu> createState() => _boutonsMenuState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _boutonsMenuState extends State<boutonsMenu> {
  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return AppBar(
      actions: <Widget>[
        TextButton.icon(
          onPressed: () {
            if (currentRoute != '/citation') {
              Navigator.pushNamed(context, '/citation');
            }
          },
          icon: const Icon(Icons.assistant, color: Colors.indigo),
          label: Text(
            AppLocalizations.of(context)!.citation,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        TextButton.icon(
          onPressed: () {
            if (currentRoute != '/map') {
              Navigator.pushNamed(context, '/map');
            }
          },
          icon: const Icon(Icons.map, color: Colors.indigo),
          label: Text(
            AppLocalizations.of(context)!.carte,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        TextButton.icon(
          onPressed: () {
            if (currentRoute != '/silhouette') {
              Navigator.pushNamed(context, '/silhouette');
            }
          },
          icon: const Icon(Icons.account_box, color: Colors.indigo),
          label: Text(
            AppLocalizations.of(context)!.silhouette,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) => <PopupMenuEntry<burger>>[
            const PopupMenuItem<burger>(
              value: burger.apropos,
              child: Text("À propos"),
            ),
          ],
        ),
      ],
    );
  }
}
