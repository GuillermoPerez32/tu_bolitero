import 'package:flutter/material.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';

class PiramideScreen extends StatelessWidget {
  const PiramideScreen({
    super.key,
    required this.result,
  });

  final LotteryResult result;

  @override
  Widget build(BuildContext context) {
    final piramide = getPiramide();
    final result1 = piramide[1][0] + piramide[2][0];
    final result2 = piramide[1][0] + piramide[1][1];
    final result3 = piramide[1][4] + piramide[1][5];
    final result4 = piramide[5][0] + piramide[6][0];
    final result5 = piramide[5][0] + piramide[5][1];
    final result6 = piramide[6][0] + piramide[5][1];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pronóstico Piramidal'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text(
                result.fecha.toString().split(' ')[0],
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Piramide(piramide: piramide),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CombinationBall(
                        number: result1,
                        borderColor: const Color.fromARGB(255, 103, 80, 164),
                      ),
                      CombinationBall(
                        number: result2,
                        borderColor: const Color.fromARGB(230, 255, 198, 198),
                      ),
                      CombinationBall(
                        number: result3,
                        borderColor: const Color.fromARGB(220, 255, 214, 0),
                      ),
                      CombinationBall(
                        number: result4,
                        borderColor: const Color.fromARGB(255, 164, 239, 128),
                      ),
                      CombinationBall(
                        number: result5,
                        borderColor: const Color.fromARGB(255, 84, 181, 222),
                      ),
                      CombinationBall(
                        number: result6,
                        borderColor: const Color.fromARGB(255, 255, 0, 0),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> getPiramide() {
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
        borderRadius: BorderRadius.circular(100),
        border: Border.all(width: 4, color: borderColor),
      ),
      height: 60,
      width: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < piramide.length; i++)
          Text(
            piramide[i],
            style: const TextStyle(
                fontSize: 32, letterSpacing: 24, fontWeight: FontWeight.bold),
          ),
      ],
    );
  }
}
