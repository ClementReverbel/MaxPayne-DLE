import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/elements/boutonsMenu.dart';
import 'package:maxpaynedle/pages/citation.dart';
import 'package:maxpaynedle/pages/map.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sqflite/sqflite.dart';

import '../class_DB/DB.dart';

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
    setState(() {}); // Trigger rebuild after DB is initialized
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
                'Bienvenue sur MaxPayneDLE',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Une expérience immersive autour de l’univers de Max Payne. '
                'Explorez les citations marquantes, localisez les lieux, '
                'et identifiez les silhouettes emblématiques.',
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.assistant),
                    label: const Text('Citations'),
                    onPressed: () => Navigator.pushNamed(context, '/citation'),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.map),
                    label: const Text('Carte'),
                    onPressed: () => Navigator.pushNamed(context, '/map'),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.account_box),
                    label: const Text('Silhouettes'),
                    onPressed:
                        () => Navigator.pushNamed(context, '/silhouette'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
