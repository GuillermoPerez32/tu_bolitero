import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu Bolitero'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeTile(
            title: 'Resultados de loterias',
            imageSrc: 'assets/Ellipse 1.png',
            onTap: () => context.go('/results'),
          ),
          const Divider(),
          HomeTile(
            title: 'Atrasados',
            imageSrc: 'assets/atrasados.png',
            onTap: () => context.go('/atrasados'),
          ),
          const Divider(),
          HomeTile(
            title: 'Número de la suerte',
            imageSrc: 'assets/suerte.png',
            onTap: () => context.go('/numero_suerte'),
          ),
          const Divider(),
          HomeTile(
            title: 'Charada',
            imageSrc: 'assets/charada.png',
            onTap: () => context.go('/charada'),
          ),
        ],
      ),
    );
  }
}

class HomeTile extends StatelessWidget {
  final String title;

  final String imageSrc;

  final void Function()? onTap;

  const HomeTile({
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
