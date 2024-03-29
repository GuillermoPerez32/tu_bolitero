import 'package:flutter/material.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';

class TablaDiosesScreen extends StatelessWidget {
  const TablaDiosesScreen({
    super.key,
    required this.result,
  });

  final LotteryResult result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabla de los Dioses'),
      ),
    );
  }
}
