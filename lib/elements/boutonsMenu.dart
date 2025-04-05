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
            style: TextStyle(color: Colors.black),
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
          onSelected: (burger item) {
            if (item == burger.apropos) {
              showAboutDialog(
                context: context,
                applicationName: 'MaxPayneDLE',
                applicationVersion: '1.0.0',
                applicationIcon: Icon(
                  Icons.gamepad,
                  size: 40,
                  color: Colors.orange,
                ),
                children: [
                  Text(
                    AppLocalizations.of(context)!.aproposdesc,
                  ),
                ],
              );
            }
          },
          itemBuilder:
              (BuildContext context) => <PopupMenuEntry<burger>>[
                PopupMenuItem<burger>(
                  value: burger.apropos,
                  child: Text(AppLocalizations.of(context)!.apropos),
                ),
              ],
        ),
      ],
    );
  }
}
