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
            onTap: () => context.go('/results/1'),
          ),
          ResultsTile(
            title: 'Venezuela',
            imageSrc: 'assets/sun.png',
            onTap: () => context.go('/results/2'),
          ),
          ResultsTile(
            title: 'Florida',
            imageSrc: 'assets/sun.png',
            onTap: () => context.go('/results/3'),
          ),
          ResultsTile(
            title: 'Haití',
            imageSrc: 'assets/sun.png',
            onTap: () => context.go('/results/4'),
          ),
          ResultsTile(
            title: 'Haití',
            imageSrc: 'assets/sun.png',
            onTap: () => context.go('/results/5'),
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
