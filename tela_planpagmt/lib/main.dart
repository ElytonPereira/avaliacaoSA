import 'package:flutter/material.dart';
import 'package:tela_planpagmt/telas/tela_plano_pagamento.dart';

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
      initialRoute: '/TelaPagamento',
      routes: {'/TelaPagamento': (context) => const TelaPagamento()},
    );
  }
}
