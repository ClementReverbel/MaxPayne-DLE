import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Location{
  final int id;
  final String path;
  final String place;

  const Location({required this.id, required this.path, required this.place});

  //Transforme les objets de classe Location en map pour être compatible avec SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'path': path,
      'place': place
    };
  }

  // Rajouter une location dans la BD
  static Future<void> insertMap(Location location) async {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'maxpaynedle.db'),
    );

    await db.insert(
      'location',
      location.toMap(), //Transforme l'objet Location en map pour l'insertion
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //Permet d'insérer un jeu de données dans la base de données à son initialisation
  static Future<void> insertAllLocation() async {
    // Liste des locations/map à insérer à l'initialisation
    List<Location> locations = [
      Location(id: 1, path: 'assets/location/55th_ballation_hq.jpg', place:"55th Ballation HQ"),
      Location(id: 2, path: 'assets/location/canal_de_panama.jpg', place:"Canal de Panama"),
      Location(id: 3, path: 'assets/location/departure_lounge.jpg', place:"Departure Lounge"),
      Location(id: 4, path: 'assets/location/favela_heights.jpg', place:"Favela Heights"),
      Location(id: 5, path: 'assets/location/imperial_palace.jpg', place:"Imperial palace"),
      Location(id: 6, path: 'assets/location/roscoe_street_subway.jpg', place:"Roscoe street subway"),
      Location(id: 7, path: 'assets/location/shoot_first.jpg', place:"Shoot first"),
    ];

    // Boucle dans la liste pour les rajouter à chaque fois
    for (var location in locations) {
      await insertMap(location);
    }
  }

  //Permet de rechercher une carte du jeu grâce à son id dans la BD
  //Le ? permet de rendre le rendu nullable pour une future méthode
  static Future<Location?> readOne(int id) async {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'maxpaynedle.db'),
    );

    //Permet de faire une requête SELECT SQL avec une paramètre (id)
    final List<Map<String, dynamic>> maps = await db.query(
      'location',
      where: 'id = ?',
      whereArgs: [id],
    );

    //Vérifie si l'id avait bien un résultat associé
    if (maps.isNotEmpty) {
      // Prend le premier (et le seul mais la méthode db.query retourne une liste de map)
      // résultat renvoyé par la requête et le convertit en objet
      return Location(
        id: maps.first['id'],
        path: maps.first['path'],
        place: maps.first['place'],
      );
    } else {
      return null;
    }
  }
}