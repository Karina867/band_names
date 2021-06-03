// Primero se colocan los de flutter
// Segundo se colocan arriba paquetes de terceros
// Tercero se colocan los nuestros

import 'package:flutter/material.dart';

import 'package:band_names/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {'home': (_) => HomePage()});
  }
}
