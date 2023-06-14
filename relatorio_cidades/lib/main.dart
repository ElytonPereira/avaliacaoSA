import 'package:flutter/material.dart';
import 'package:relatorio_cidades/telas/relatorio_cidades.dart';


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
      initialRoute: '/TelaRelatorioCidades',
      routes: {'/TelaRelatorioCidades': (context) => const TelaRelatorioCidades()},
    );
  }
}
