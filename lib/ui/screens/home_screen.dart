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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HomeTile(
            title: 'Resultados de loterias',
            imageSrc: 'assets/Ellipse 1.png',
            onTap: () => context.go('/results'),
          ),
          HomeTile(
            title: 'Atrasados',
            imageSrc: 'assets/atrasados.png',
            onTap: () => context.go('/atrasados'),
          ),
          HomeTile(
            title: 'Algoritmos',
            imageSrc: 'assets/algoritmos.png',
            onTap: () => context.go('/algoritmos'),
          ),
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
    const tileHeight = 150.0;
    return SizedBox(
      height: tileHeight,
      child: Center(
        child: ListTile(
          visualDensity: VisualDensity.compact,
          onTap: onTap,
          tileColor: Colors.white,
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
          title: SizedBox(
            height: tileHeight,
            child: Column(
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
        ),
      ),
    );
  }
}
