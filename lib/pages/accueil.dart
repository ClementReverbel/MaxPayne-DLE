import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/elements/boutonsMenu.dart';
import 'package:maxpaynedle/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maxpaynedle/pages/map.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../class_DB/DB.dart';
import '../elements/ScoreProvider.dart';

class acceuil extends StatefulWidget {
  const acceuil({super.key});

  @override
  State<acceuil> createState() => _acceuilState();
}

class _acceuilState extends State<acceuil> {
  final DB db = DB();

  @override
  void initState() {
    super.initState();
    _initDB();
  }

  Future<void> _initDB() async {
    await getDatabasesPath().then((value) => debugPrint(value));
    await db.initDatabase();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const boutonsMenu(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              AppLocalizations.of(context)!.bienvenue,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.presentation,
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.assistant),
                    label: Text(AppLocalizations.of(context)!.citation),
                    onPressed: () => Navigator.pushNamed(context, '/citation'),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.map),
                    label: Text(AppLocalizations.of(context)!.carte,),
                    onPressed: () => Navigator.pushNamed(context, '/map'),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.account_box),
                    label: Text(AppLocalizations.of(context)!.silhouette,),
                    onPressed:
                        () => Navigator.pushNamed(context, '/silhouette'),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Center(child:  Consumer<ScoreProvider>(
                builder: (context,provider,child) {
                  return Text(AppLocalizations.of(context)!.score(provider.score), style: TextStyle(fontSize: 25),);
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
