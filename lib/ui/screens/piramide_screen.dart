import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';

class PiramideScreen extends StatelessWidget {
  const PiramideScreen({
    super.key,
    required this.lotteryId,
  });

  final String lotteryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BoliteroAppBar(
        title: Text(appTitle),
      ),
      bottomNavigationBar: const BottomBar(index: 1),
      body: BlocBuilder<LotteryCubit, LotteryState>(
        builder: (context, state) {
          final lottery = state.lotteries
              .where((element) => '${element.id}' == lotteryId)
              .toList()[0];
          final results = lottery.anteriores;

          final piramides =
              results.map((result) => getPiramide(result)).toList();

          return Center(
            child: ListView.builder(
              itemCount: piramides.length,
              itemBuilder: (context, index) {
                final result = results[index];
                final piramide = piramides[index];
                final result1 = piramide[1][0] + piramide[2][0];
                final result2 = piramide[1][0] + piramide[1][1];
                final result3 = piramide[1][4] + piramide[1][5];
                final result4 = piramide[5][0] + piramide[6][0];
                final result5 = piramide[5][0] + piramide[5][1];
                final result6 = piramide[6][0] + piramide[5][1];

                final isDay = result.fecha.hour > 6 && result.fecha.hour < 18;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Theme.of(context).colorScheme.surface,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat('dd-MM-yyyy').format(result.fecha),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Image.asset(
                              isDay ? 'assets/sun.png' : 'assets/moon.png',
                              height: 40,
                              width: 40,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _Piramide(piramide: piramide),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CombinationBall(
                                number: result1,
                                borderColor:
                                    const Color.fromARGB(255, 103, 80, 164),
                              ),
                              const SizedBox(width: 10),
                              CombinationBall(
                                number: result2,
                                borderColor:
                                    const Color.fromARGB(230, 255, 198, 198),
                              ),
                              const SizedBox(width: 10),
                              CombinationBall(
                                number: result3,
                                borderColor:
                                    const Color.fromARGB(220, 255, 214, 0),
                              ),
                              const SizedBox(width: 10),
                              CombinationBall(
                                number: result4,
                                borderColor:
                                    const Color.fromARGB(255, 164, 239, 128),
                              ),
                              const SizedBox(width: 10),
                              CombinationBall(
                                number: result5,
                                borderColor:
                                    const Color.fromARGB(255, 84, 181, 222),
                              ),
                              const SizedBox(width: 10),
                              CombinationBall(
                                number: result6,
                                borderColor:
                                    const Color.fromARGB(255, 255, 0, 0),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  List<String> getPiramide(LotteryResult result) {
    final List<String> list = [];
    final initialNumber = result.pick3 + result.pick4;

    list.add(initialNumber);

    while (list[list.length - 1].length > 1) {
      final last = list[list.length - 1];
      var nextSeq = '';
      for (var i = 0; i < last.length - 1; i++) {
        final a = int.parse(last[i]);
        final b = int.parse(last[i + 1]);
        final sum = a + b;
        final lastDigit = sum % 10;
        nextSeq += (lastDigit).toString();
      }
      list.add(nextSeq);
    }

    return list;
  }
}

class CombinationBall extends StatelessWidget {
  const CombinationBall({
    super.key,
    required this.number,
    required this.borderColor,
  });

  final String number;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(100),
      ),
      height: 45,
      width: 45,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _Piramide extends StatelessWidget {
  const _Piramide({
    required this.piramide,
  });

  final List<String> piramide;

  @override
  Widget build(BuildContext context) {
    final rowColors = [
      const Color.fromARGB(255, 152, 111, 209),
      const Color.fromARGB(255, 173, 212, 85),
      const Color.fromARGB(255, 248, 139, 44),
      const Color.fromARGB(255, 232, 168, 235),
      const Color.fromARGB(255, 97, 139, 250),
      const Color.fromARGB(255, 255, 98, 95),
      const Color.fromARGB(255, 255, 215, 85),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < piramide.length; i++)
          PiramideText(text: piramide[i], color: rowColors[i]),
      ],
    );
  }
}

class PiramideText extends StatelessWidget {
  const PiramideText({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 32,
          letterSpacing: 24,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
