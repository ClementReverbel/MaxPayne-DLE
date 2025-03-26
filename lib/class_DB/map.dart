import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Location{
  final int id;
  final String path;
  final String place;

  const Location({required this.id, required this.path, required this.place});

  //Transforme les objets de classe Map en map (natif) pour être compatible avec SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'path': path,
      'place': place
    };
  }

  // Insert a map into the database
  static Future<void> insertMap(Location location) async {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'maxpaynedle.db'),
    );

    await db.insert(
      'location', // table name
      location.toMap(), // Map object converted to a map
      conflictAlgorithm: ConflictAlgorithm.replace, // Handle duplicates
    );
  }
}