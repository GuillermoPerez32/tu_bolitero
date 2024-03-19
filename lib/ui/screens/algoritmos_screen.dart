import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlgoritmosScreen extends StatelessWidget {
  const AlgoritmosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Algoritmos'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlgoritmoTile(
            title: 'Pronóstico Piramidal',
            imageSrc: 'assets/piramide.png',
            onTap: () => context.go('/algoritmos/piramide'),
          ),
          const Divider(),
          AlgoritmoTile(
            title: 'Cruz de la suerte',
            imageSrc: 'assets/cruz.png',
            onTap: () => context.go('/algoritmos/cruz_suerte'),
          ),
          const Divider(),
          AlgoritmoTile(
            title: 'Número de la suerte',
            imageSrc: 'assets/suerte.png',
            onTap: () => context.go('/algoritmos/numero_suerte'),
          ),
          const Divider(),
          AlgoritmoTile(
            title: 'Tabla de los dioses',
            imageSrc: 'assets/table.png',
            onTap: () => context.go('/algoritmos/table'),
          ),
        ],
      ),
    );
  }
}

class AlgoritmoTile extends StatelessWidget {
  final String title;

  final String imageSrc;

  final void Function()? onTap;

  const AlgoritmoTile({
    super.key,
    required this.title,
    required this.imageSrc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        visualDensity: VisualDensity.compact,
        onTap: onTap,
        leading: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imageSrc),
            ),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_outlined),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
