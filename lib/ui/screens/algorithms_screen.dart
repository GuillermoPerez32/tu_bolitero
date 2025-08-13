import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/ui/widgets/algoritmo_tile.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';

class AlgorithmsScreen extends StatelessWidget {
  const AlgorithmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BoliteroAppBar(
        title: Text(appTitle),
      ),
      bottomNavigationBar: const BottomBar(index: 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AlgoritmoTile(
            title: 'Pronóstico Piramidal',
            imageSrc: 'assets/piramide.png',
            onTap: () => context.go('/algorithms/piramide'),
          ),
          AlgoritmoTile(
            title: 'Trébol de la suerte',
            imageSrc: 'assets/cruz.png',
            onTap: () => context.go('/algorithms/cruz_suerte'),
          ),
          AlgoritmoTile(
            title: 'Número de la suerte',
            imageSrc: 'assets/charada.png',
            onTap: () => context.go('/algorithms/numero_suerte'),
          ),
          // AlgoritmoTile(
          //   title: 'Tabla de los dioses',
          //   imageSrc: 'assets/table.png',
          //   onTap: () => context.go('/algorithms/table'),
          // ),
        ],
      ),
    );
  }
}
