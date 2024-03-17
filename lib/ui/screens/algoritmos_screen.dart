import 'package:flutter/material.dart';

class AlgoritmosScreen extends StatelessWidget {
  const AlgoritmosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Algoritmos'),
      ),
      body: const Center(
        child: Text(
          'Algoritmos Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
