import 'package:flutter/material.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.lotteryId});

  final String lotteryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      bottomNavigationBar: const BottomBar(index: 2),
      body: const Center(
        child: Text('Pantalla de Resultados'),
      ),
    );
  }
}
