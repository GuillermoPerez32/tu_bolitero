import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados de loterias'),
      ),
      body: ListView(
        children: [
          ResultsTile(
            title: 'Miami',
            imageSrc: 'assets/sun.png',
            onTap: () => context.go('/results/nacional'),
          ),
          ResultsTile(
            title: 'Venezuela',
            imageSrc: 'assets/sun.png',
            onTap: () => context.go('/results/real'),
          ),
          ResultsTile(
            title: 'Florida',
            imageSrc: 'assets/sun.png',
            onTap: () => context.go('/results/leidsa'),
          ),
          ResultsTile(
            title: 'Haití',
            imageSrc: 'assets/sun.png',
            onTap: () => context.go('/results/loteka'),
          ),
          ResultsTile(
            title: 'Haití',
            imageSrc: 'assets/sun.png',
            onTap: () => context.go('/results/loteka'),
          ),
        ],
      ),
    );
  }
}

class ResultsTile extends StatelessWidget {
  final String title;

  final String imageSrc;

  final void Function()? onTap;

  const ResultsTile({
    super.key,
    required this.title,
    required this.imageSrc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const tileHeight = 150.0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
