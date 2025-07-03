import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';

class NumberChipInput extends StatefulWidget {
  final void Function(List<String>, String) onSubmitted;

  const NumberChipInput({super.key, required this.onSubmitted});

  @override
  State<NumberChipInput> createState() => _NumberChipInputState();
}

class _NumberChipInputState extends State<NumberChipInput> {
  final TextEditingController _numbersController = TextEditingController();
  late String _lottery;
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
    _numbersController.clear();
  }

  void _remove(String num) {
    setState(() {
      _numbers.remove(num);
    });
  }

  @override
  void initState() {
    super.initState();
    _lottery = '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LotteryCubit, LotteryState>(
      builder: (context, state) {
        // Set default lottery to first one if available and not already set
        if (_lottery.isEmpty && state.lotteries.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              _lottery = state.lotteries.first.nombre;
            });
          });
        }
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
                      (number) => Chip(
                        label: Text(
                          number.padLeft(2, '0'),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        deleteIconColor:
                            Theme.of(context).colorScheme.onPrimary,
                        deleteIcon: const Icon(Icons.close_rounded),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          side: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        onDeleted: () => _remove(number),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 12),
              // dropdown of lotteries
              state.lotteries.isNotEmpty
                  ? DropdownButtonFormField<String>(
                      value: state.lotteries.isNotEmpty
                          ? state.lotteries.first.nombre
                          : _lottery,
                      items: state.lotteries.map((lottery) {
                        return DropdownMenuItem(
                          value: lottery.nombre,
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      host + lottery.logo,
                                    ),
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(lottery.nombre)
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _lottery = value;
                          });
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Selecciona una lotería',
                        border: OutlineInputBorder(),
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 12),
              TextField(
                controller: _numbersController,
                keyboardType: TextInputType.number,
                onSubmitted: _add,
                onChanged: (value) {
                  final endsInDot = value.endsWith('.');
                  final endsInComma = value.endsWith(',');

                  if ((endsInDot || endsInComma) &&
                      value.isNotEmpty &&
                      value.length <= 4) {
                    _add(value.substring(0, value.length - 1));
                  }
                  setState(() {});
                },
                decoration: InputDecoration(
                  labelText: "Número",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add),
                    color: _numbersController.text.isEmpty
                        ? Theme.of(context).colorScheme.onSurfaceVariant
                        : Theme.of(context).colorScheme.primary,
                    onPressed: () => _add(_numbersController.text),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilledButton(
                    onPressed: _numbers.isEmpty
                        ? null
                        : () {
                            widget.onSubmitted(_numbers, _lottery);
                            context.pop();
                          },
                    child: const Text("Publicar"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
