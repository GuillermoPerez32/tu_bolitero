import 'package:flutter/material.dart';

class AtrasadosScreen extends StatelessWidget {
  const AtrasadosScreen({super.key, required this.lotteryId});

  final String lotteryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atrasados'),
      ),
      body: Center(
        child: Text(lotteryId),
      ),
    );
  }
}
