import 'package:flutter/material.dart';

class LotteriesListScreen extends StatelessWidget {
  const LotteriesListScreen({super.key, required this.onLotterySelected});

  final Function(String) onLotterySelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loterías'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Lotería $index'),
            onTap: () => onLotterySelected(index.toString()),
          );
        },
      ),
    );
  }
}
