import 'package:flutter/material.dart';

class AtrasadosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atrasados'),
      ),
      body: Center(
        child: Text(
          'Atrasados Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
