import 'package:flutter/material.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';

class PiramideScreen extends StatelessWidget {
  const PiramideScreen({
    super.key,
    required this.result,
  });

  final LotteryResult result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pronóstico Piramidal'),
      ),
    );
  }
}
