import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/elements/boutonsMenu.dart';

class findMap extends StatelessWidget {
  const findMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
            Text("Map", style: TextStyle(fontSize: 40))),
        appBar: AppBar(
            title: Text("Map"),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
        actions: boutonsMenu.build(context),));
  }
}
