import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/elements/boutonsMenu.dart';

class silhouette extends StatelessWidget {
  const silhouette({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
            Text("Silhouette", style: TextStyle(fontSize: 40))),
        appBar: const boutonsMenu());
  }
}
