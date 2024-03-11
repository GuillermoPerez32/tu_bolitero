import 'package:flutter/material.dart';

class CharadaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charada'),
      ),
      body: Center(
        child: Text(
          'Charada Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
