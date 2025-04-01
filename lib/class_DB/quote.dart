import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Quote{
  final int id;
  final String character;
  final String quote;

  const Quote({required this.id, required this.character, required this.quote});

  //Transforme les objets de type Quote en map pour être compatible avec SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quote': quote,
      'character': character
    };
  }

  //Permet d'insérer dans la base de données une nouvelle citation
  static Future<void> insertQuote(Quote quote) async {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'maxpaynedle.db'),
    );

    await db.insert(
      'quote',
      quote.toMap(), //Transforme l'objet Quote en map pour l'insertion
      conflictAlgorithm: ConflictAlgorithm.replace, //Permet d'éviter les conflits SQL
    );
  }

  //Permet d'insérer un jeu de données de citation dans la BD à son initialisation
  static Future<void> insertAllQuotes(db) async {
    // Liste des citations à insérer à l'initialisation
    List<Quote> quotes = [
      Quote(id: 1, character: "Max Payne", quote: "I don't know about angels, but it's fear that gives men wings."),
      Quote(id: 2, character: "Vlad Lem", quote: "Nothing wrong with a little self-improvement."),
      Quote(id: 3, character: "Mona Sax", quote: "You're in a computer game, Max."),
      Quote(id: 4, character: "Jack Lupino", quote: "The flesh of fallen angels."),
      Quote(id: 5, character: "Detective Winterson", quote: "You piece together a jigsaw, and the final picture is you finishing that same puzzle."),
      Quote(id: 6, character: "Raul Passos", quote: "I might be a coward, but I’m not a liar."),
      Quote(id: 7, character: "Victor Branco", quote: "You think you’re so righteous, Payne? You’re just another thug with a gun!"),
      Quote(id: 8, character: "Max Payne", quote: "The past is a gaping hole. You try to run from it, but the more you run, the deeper, more terrible it grows behind you."),
      Quote(id: 9, character: "Max Payne", quote: "I had to keep moving. The truth was out there, but I had no way of knowing if I would ever find it."),
      Quote(id: 10, character: "Vlad Lem", quote: "Don't make it personal, Max. You and I, we're just two guys doing a job."),
      Quote(id: 11, character: "Raul Passos", quote: "You can't trust anyone, Max. The world is full of betrayal."),
      Quote(id: 12, character: "Mona Sax", quote: "You're right, Max. We're both broken."),
      Quote(id: 13, character: "Jack Lupino", quote: "I should have stayed in bed, but I had a score to settle."),
      Quote(id: 14, character: "Detective Winterson", quote: "You can't keep running from your past, Max."),
      Quote(id: 15, character: "Raul Passos", quote: "Stay sharp, Max. They're always one step ahead."),
    ];

    // Boucle dans la liste pour les rajouter à chaque fois
    for (var quote in quotes) {
      await db.insert(
        'quote',
        quote.toMap(), //Transforme l'objet Quote en map pour l'insertion
        conflictAlgorithm: ConflictAlgorithm.replace, //Permet d'éviter les conflits SQL
      );
    }
  }

  //Permet de chercher une citation dans la BD grâce à son ID
  //Le ? permet de rendre le rendu nullable pour une future méthode
  static Future<Quote?> readOne(int id) async {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'maxpaynedle.db'),
    );

    //Permet de faire une requête SELECT SQL avec une paramètre (id)
    final List<Map<String, dynamic>> maps = await db.query(
      'quote',
      where: 'id = ?',
      whereArgs: [id],
    );

    //Vérifie si l'id avait bien un résultat associé
    if (maps.isNotEmpty) {
      // Prend le premier (et le seul mais la méthode db.query retourne une liste de map)
      // résultat renvoyé par la requête et le convertit en objet
      return Quote(
        id: maps.first['id'],
        quote: maps.first['quote'],
        character: maps.first['character'],
      );
    } else {
      return null;
    }
  }

}