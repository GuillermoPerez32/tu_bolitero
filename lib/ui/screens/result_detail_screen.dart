import 'package:flutter/material.dart';

class ResultDetailScreen extends StatelessWidget {
  const ResultDetailScreen({super.key, required this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados de loterias'),
      ),
      body: Center(
        child: Text('Result Detail Screen for lottery $id'),
      ),
    );
  }
}
