import 'package:flutter/material.dart';
import 'package:maxpaynedle/pages/accueil.dart';
import 'package:maxpaynedle/pages/citation.dart';
import 'package:maxpaynedle/pages/map.dart';
import 'package:maxpaynedle/pages/silhouette.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MainApp());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaxPayneDLE',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr'),
        Locale('en')
      ],
      navigatorObservers: [routeObserver],
      routes: {
        '/accueil': (context) => acceuil(),
        '/citation': (context) => citation(),
        '/map': (context) => findMap(),
        '/silhouette': (context) => silhouette(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Colors.orange, //Permet de fixer la couleur de la barre d'application directement depuis le thème
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: acceuil(), //Définit la page d'accueil de l'application
    );
  }
}
