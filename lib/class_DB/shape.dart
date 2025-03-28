import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Shape{
  final int id;
  final String path_shape;
  final String path_full_image;
  final String character;

  const Shape({required this.id, required this.path_shape, required this.path_full_image, required this.character});

  //Transforme les objets de classe Location en map pour être compatible avec SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'path_shape': path_shape,
      'path_full_image': path_full_image,
      'character': character
    };
  }

  // Rajouter une location dans la BD
  static Future<void> insertMap(Shape shape) async {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'maxpaynedle.db'),
    );

    await db.insert(
      'shape',
      shape.toMap(), //Transforme l'objet Shape en map pour l'insertion
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> insertAllShape() async {
    // Liste des locations/map à insérer à l'initialisation
    List<Shape> shapes = [
      Shape(id: 1, path_shape: 'assets/shape/Alfred_Woden.jpg', path_full_image:'assets/character/Alfred_Woden.jpg', character:'Alfred Woden'),
      Shape(id: 2, path_shape: 'assets/shape/Anthony_DeMarco.jpg', path_full_image:'assets/character/Anthony_DeMarco.jpg', character:'Anthony DeMarco'),
      Shape(id: 3, path_shape: 'assets/shape/Max_Payne.jpg', path_full_image:'assets/character/Max_Payne.jpg', character:'Max Payne'),
      Shape(id: 4, path_shape: 'assets/shape/Mona_Sax.jpg', path_full_image:'assets/character/Mona_Sax.jpg', character:'Mona Sax'),
      Shape(id: 5, path_shape: 'assets/shape/Nicole_Horne.jpg', path_full_image:'assets/character/Nicole_Horne.jpg', character:'Nicole Horne'),
      Shape(id: 6, path_shape: 'assets/shape/Raul_Passos.jpg', path_full_image:'assets/character/Raul_Passos.jpg', character:'Raul Passos'),
      Shape(id: 7, path_shape: 'assets/shape/Tony_DeMarco.jpg', path_full_image:'assets/character/Tony_DeMarco.jpg', character:'Tony DeMarco'),

    ];

    // Boucle dans la liste pour les rajouter à chaque fois
    for (var shape in shapes) {
      await insertMap(shape);
    }
  }
}