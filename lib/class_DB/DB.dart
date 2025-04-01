import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'quote.dart';
import 'location.dart';
import 'shape.dart';

class DB {
  //Permet de faire une promesse de valeur à database le temps de son initialisation
  late Database _database;

  //Création (et connexion) à la base de données SQLite
  Future<void> initDatabase() async {
    //Vérifie la version de flutter pour éviter les erreurs
    WidgetsFlutterBinding.ensureInitialized();
    //Créer la connexion grâce au package path automatiquement
    _database = await openDatabase(
      join(await getDatabasesPath(), 'maxpaynedle.db'),
      //Si c'est la première éxecution alors on crée les tables de la BD
      onCreate: (db, version) async {
        debugPrint("Création de la base de données...");
        await db.execute(
          'CREATE TABLE quote(id INTEGER PRIMARY KEY, character TEXT, quote TEXT)',
        );

        await db.execute(
          'CREATE TABLE location(id INTEGER PRIMARY KEY, path TEXT, place TEXT)',
        );

        await db.execute(
          'CREATE TABLE shape(id INTEGER PRIMARY KEY, path_shape TEXT, path_full_image TEXT, character TEXT)',
        );

        debugPrint("Insertion...");
        await Location.insertAllLocation(db);
        await Quote.insertAllQuotes(db);
        await Shape.insertAllShape(db);

        debugPrint("Base de données créée");
      },
      version: 1,
    );
  }

  //Le getter de la classe pour récupérer la bd et s'y connecter
  Database get database => _database;
}
