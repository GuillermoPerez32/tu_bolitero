import 'package:flutter/material.dart';

class AtrasadosScreen extends StatelessWidget {
  const AtrasadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atrasados'),
      ),
      body: const Center(
        child: Text(
          'Atrasados Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
