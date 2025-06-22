import 'package:flutter/material.dart';

class NumberTable extends StatelessWidget {
  const NumberTable({super.key, required this.data});

  final List<List<String>> data;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: data.map<TableRow>((row) {
        return TableRow(
          children: row.map<Widget>((cell) {
            return Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Theme.of(context).cardTheme.color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Center(
                  child: Text(
                    cell,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
