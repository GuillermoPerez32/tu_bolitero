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
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Center(
                  child: Text(
                    cell,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const Color.fromRGBO(60, 60, 67, 0.6)),
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
