import 'package:flutter/material.dart';
import 'package:tela_cidade/telas/tela_cidade.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/TelaCidade',
      routes: {'/TelaCidade': (context) => const TelaCidade()},
    );
  }
}
