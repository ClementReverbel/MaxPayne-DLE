import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/elements/boutonsMenu.dart';

class citation extends StatelessWidget {
  const citation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
            Text("Citation", style: TextStyle(fontSize: 40))),
        appBar: const boutonsMenu()
          );
  }
}
