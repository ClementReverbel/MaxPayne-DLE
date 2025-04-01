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
    await getDatabasesPath().then((value)=>debugPrint(value));
    await db.initDatabase();
    setState(() {}); // Trigger rebuild after DB is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const boutonsMenu(),
      body: Center(
        child: Text("Les infos en question", style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
