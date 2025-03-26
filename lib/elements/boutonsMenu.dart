import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxpaynedle/main.dart';
import '../pages/citation.dart';
import '../pages/map.dart';

class boutonsMenu {
  static List<Widget> build(BuildContext context) {
    return <Widget>[
      TextButton.icon(
        onPressed: () {
          if(context != '/citation')
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => citation()),
          );
        },
        icon: const Icon(Icons.assistant),
        label: const Text('Citation', style: TextStyle(color: Colors.black)),
        iconAlignment: IconAlignment.start,
      ),
      TextButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => findMap()),
          );
        },
        icon: const Icon(Icons.map),
        label: const Text('Map', style: TextStyle(color: Colors.black)),
        iconAlignment: IconAlignment.start,
      ),
      TextButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => citation()),
          );
        },
        icon: const Icon(Icons.account_box),
        label: const Text('Silhouette', style: TextStyle(color: Colors.black)),
        iconAlignment: IconAlignment.start,
      ),
    ];
  }
}
