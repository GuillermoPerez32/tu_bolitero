import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NumberChipInput extends StatefulWidget {
  final void Function(List<String>) onSubmitted;

  const NumberChipInput({super.key, required this.onSubmitted});

  @override
  State<NumberChipInput> createState() => _NumberChipInputState();
}

class _NumberChipInputState extends State<NumberChipInput> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _numbers = [];

  void _add(String input) {
    final clean = input.trim();
    if (clean.isNotEmpty &&
        int.tryParse(clean) != null &&
        !_numbers.contains(clean) &&
        clean.length <= 3) {
      setState(() {
        _numbers.add(clean);
      });
    }
    _controller.clear();
  }

  void _remove(String num) {
    setState(() {
      _numbers.remove(num);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min, // <— clave para sheet
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Agrega números:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _numbers
                .map(
                  (num) => Chip(
                    label: Text(
                      num.padLeft(2, '0'),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    deleteIconColor: Theme.of(context).colorScheme.onPrimary,
                    deleteIcon: const Icon(Icons.close_rounded),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      side: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    onDeleted: () => _remove(num),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            onSubmitted: _add,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              labelText: "Número",
              suffixIcon: IconButton(
                icon: const Icon(Icons.add),
                color: _controller.text.isEmpty
                    ? Theme.of(context).colorScheme.onSurfaceVariant
                    : Theme.of(context).colorScheme.primary,
                onPressed: () => _add(_controller.text),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: () {
                  widget.onSubmitted(_numbers);
                  context.pop();
                },
                child: const Text("Publicar"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
