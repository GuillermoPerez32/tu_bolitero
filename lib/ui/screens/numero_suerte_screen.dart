import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/ui/logic/luck/luck_cubit.dart';
import 'package:tu_bolitero/ui/logic/luck/luck_state.dart';

class NumeroSuerteScreen extends StatelessWidget {
  const NumeroSuerteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final luckBloc = BlocProvider.of<LuckCubit>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Número de suerte'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: primaryColor, width: 2.0),
                  ),
                  height: 200,
                  width: 200,
                  child: BlocBuilder<LuckCubit, LuckState>(
                    builder: (context, state) {
                      final number1 = state.luck != null ? state.luck![0] : '0';
                      final number2 = state.luck != null ? state.luck![1] : '0';
                      final number3 = state.luck != null ? state.luck![2] : '0';
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _LuckNumber(number: number1),
                          _LuckNumber(number: number2),
                          _LuckNumber(number: number3),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
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
                        'Toque el boton “Obtener” para que tenga su numero de la suerte'),
                const SizedBox(height: 10),
                const BottomText(text: '(1 diario)'),
              ],
            ),
          ),
        ));
  }
}

class _LuckNumber extends StatelessWidget {
  final String number;

  const _LuckNumber({
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      number,
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ).animate().scale(
          begin: Offset.zero,
          end: const Offset(1, 1),
          duration: const Duration(milliseconds: 400),
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
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
