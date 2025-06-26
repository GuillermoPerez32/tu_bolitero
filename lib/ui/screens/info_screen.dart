import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';
import 'package:tu_bolitero/ui/widgets/info_tile.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BoliteroAppBar(
        title: Text(appTitle),
      ),
      bottomNavigationBar: const BottomBar(index: 2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InfoTile(
            title: 'Resultados',
            imageSrc: 'assets/results.png',
            onTap: () => context.go('/info/results'),
          ),
          InfoTile(
            title: 'Atrasados',
            imageSrc: 'assets/atrasados.png',
            onTap: () => context.go('/info/atrasados'),
          ),
          InfoTile(
            title: 'Charada',
            imageSrc: 'assets/charada.png',
            onTap: () => context.go('/info/charada'),
          ),
        ],
      ),
    );
  }
}
