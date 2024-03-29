import 'package:flutter/material.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';

class CruzSuerteScreen extends StatelessWidget {
  const CruzSuerteScreen({
    super.key,
    required this.result,
  });

  final LotteryResult result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cruz de la suerte'),
      ),
    );
  }
}
