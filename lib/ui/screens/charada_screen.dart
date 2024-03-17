import 'package:flutter/material.dart';

class CharadaScreen extends StatelessWidget {
  const CharadaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charada'),
      ),
      body: const Center(
        child: Text(
          'Charada Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
