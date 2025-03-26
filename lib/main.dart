
import 'package:flutter/material.dart';
import 'package:maxpaynedle/pages/accueil.dart';
import 'package:maxpaynedle/pages/citation.dart';
import 'package:maxpaynedle/pages/map.dart';
import 'package:maxpaynedle/pages/silhouette.dart';

void main() {
  runApp(const MainApp());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorObservers: [routeObserver],
        routes: {
          '/accueil' : (context) => acceuil(),
          '/citation' : (context) => citation(),
          '/map' : (context) => findMap(),
          '/silhouette' : (context) => silhouette()
        },
        title: 'MaxPayneDLE',
        theme: ThemeData(
          primarySwatch: Colors.green,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.redAccent, //Permet de fixer la couleur de la barre d'application directement depuis le thème
          ),
          scaffoldBackgroundColor: Colors.grey,
        ),
        home: acceuil() //Définit la page d'accueil de l'application
    );
  }
}