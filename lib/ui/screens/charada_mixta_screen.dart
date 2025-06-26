import 'package:flutter/material.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';

class CharadaMixtaScreen extends StatelessWidget {
  const CharadaMixtaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BoliteroAppBar(
        title: Text('Charada Mixta'),
      ),
    );
  }
}
