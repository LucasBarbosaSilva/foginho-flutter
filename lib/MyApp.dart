import 'package:flutter/material.dart';
import 'package:foginho/body.dart';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: BodyFoguinho(),
      ),
    );
  }
}
