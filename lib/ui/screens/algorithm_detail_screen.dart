import 'package:flutter/material.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';

class AlgorithmDetailScreen extends StatelessWidget {
  final String algorithmId;
  final String lotteryId;

  const AlgorithmDetailScreen(
      {super.key, required this.algorithmId, required this.lotteryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BoliteroAppBar(
        title: Text('$algorithmId - $lotteryId'),
      ),
      body: const Center(
        child: Text('Pantalla de Detalle de Algoritmo'),
      ),
    );
  }
}
