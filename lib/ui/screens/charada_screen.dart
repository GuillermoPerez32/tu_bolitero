import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';

class CharadaScreen extends StatelessWidget {
  const CharadaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BoliteroAppBar(
        title: Text('Charada'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CharadaTile(
            title: 'Charada Clásica',
            imageSrc: 'assets/charada_clasica.png',
            onTap: () => context.go('/charada/clasica'),
          ),
          const Divider(),
          // CharadaTile(
          //   title: 'Charada Mixta',
          //   imageSrc: 'assets/charada_mixta.png',
          //   onTap: () => context.go('/charada/mixta'),
          // ),
        ],
      ),
    );
  }
}

class CharadaTile extends StatelessWidget {
  final String title;

  final String imageSrc;

  final void Function()? onTap;

  const CharadaTile({
    super.key,
    required this.title,
    required this.imageSrc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 40),
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
    );
  }
}
