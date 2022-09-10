import 'package:flutter/material.dart';

import 'home/main.dart';

class MottuTest extends StatelessWidget {
  const MottuTest({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Mottu',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}
