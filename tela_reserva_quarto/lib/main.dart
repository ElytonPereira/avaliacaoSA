import 'package:flutter/material.dart';
import 'package:tela_reserva_quarto/telas/reserva_quarto.dart';

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
      initialRoute: '/ReservaQuarto',
      routes: {'/ReservaQuarto': (context) => const ReservaQuarto()},
    );
  }
}
