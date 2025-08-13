import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/ui/logic/luck/luck_cubit.dart';
import 'package:tu_bolitero/ui/logic/luck/luck_state.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';

class NumeroSuerteScreen extends StatefulWidget {
  const NumeroSuerteScreen({super.key});

  @override
  State<NumeroSuerteScreen> createState() => _NumeroSuerteScreenState();
}

class _NumeroSuerteScreenState extends State<NumeroSuerteScreen> {
  final _controller1 = FixedExtentScrollController(initialItem: 0);
  final _controller2 = FixedExtentScrollController(initialItem: 0);
  final _controller3 = FixedExtentScrollController(initialItem: 0);

  // Create a long reel so we can animate through many items
  final List<String> _reelDigits =
      List.generate(100, (i) => (i % 10).toString());

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  void _spinTo(String luck) {
    final d1 = int.tryParse(luck[0]) ?? 0;
    final d2 = int.tryParse(luck[1]) ?? 0;
    final d3 = int.tryParse(luck[2]) ?? 0;

    // Add offsets so it spins multiple turns
    final base1 = 60 + d1; // about 6 full spins
    final base2 = 70 + d2;
    final base3 = 80 + d3;

    _controller1.animateToItem(
      base1,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutCubic,
    );
    _controller2.animateToItem(
      base2,
      duration: const Duration(milliseconds: 1100),
      curve: Curves.easeOutCubic,
    );
    _controller3.animateToItem(
      base3,
      duration: const Duration(milliseconds: 1300),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final luckBloc = BlocProvider.of<LuckCubit>(context);

    return Scaffold(
      appBar: const BoliteroAppBar(
        title: Text('Número de suerte'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Machine frame
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.25),
                    width: 1.5,
                  ),
                ),
                child: BlocConsumer<LuckCubit, LuckState>(
                  listenWhen: (prev, curr) => prev.luck != curr.luck && curr.luck != null,
                  listener: (context, state) {
                    if (state.luck != null && state.luck!.length >= 3) {
                      _spinTo(state.luck!);
                    }
                  },
                  builder: (context, state) {
                    final textColor = Theme.of(context).colorScheme.onSurface;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _SlotReel(
                          controller: _controller1,
                          digits: _reelDigits,
                          textColor: textColor,
                        ),
                        const SizedBox(width: 12),
                        _SlotReel(
                          controller: _controller2,
                          digits: _reelDigits,
                          textColor: textColor,
                        ),
                        const SizedBox(width: 12),
                        _SlotReel(
                          controller: _controller3,
                          digits: _reelDigits,
                          textColor: textColor,
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merienda',
                  ),
                ),
                onPressed: () {
                  luckBloc.buildLuck();
                },
                child: const Text('Obtener'),
              ),
              const SizedBox(height: 50),
              const BottomText(
                text:
                    'Toque el boton “Obtener” para que tenga su numero de la suerte',
              ),
              const SizedBox(height: 10),
              const BottomText(text: '(1 diario)'),
            ],
          ),
        ),
      ),
    );
  }
}

class _SlotReel extends StatelessWidget {
  const _SlotReel({
    required this.controller,
    required this.digits,
    required this.textColor,
  });

  final FixedExtentScrollController controller;
  final List<String> digits;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    const itemExtent = 48.0;
    return Container(
      width: 64,
      height: itemExtent * 3, // shows 3 items tall
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          ListWheelScrollView.useDelegate(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            itemExtent: itemExtent,
            perspective: 0.002,
            onSelectedItemChanged: (_) {},
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                final value = digits[index % digits.length];
                return Center(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                );
              },
              childCount: digits.length,
            ),
          ),
          // Center highlight
          Align(
            alignment: Alignment.center,
            child: Container(
              height: itemExtent,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.35),
                    width: 1.2,
                  ),
                  bottom: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.35),
                    width: 1.2,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomText extends StatelessWidget {
  const BottomText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
