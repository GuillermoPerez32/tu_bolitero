import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';

class CruzSuerteScreen extends StatelessWidget {
  const CruzSuerteScreen({
    super.key,
    required this.lotteryId,
  });

  final String lotteryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cruz de la Suerte'),
      ),
      bottomNavigationBar: const BottomBar(index: 1),
      body: BlocBuilder<LotteryCubit, LotteryState>(
        builder: (context, state) {
          if (state.lotteries.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final matching = state.lotteries
              .where((element) => '${element.id}' == lotteryId)
              .toList();

          if (matching.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final lottery = matching.first;
          final atrasados = lottery.atrasados;
          final result = lottery.anteriores.firstOrNull;

          if (result == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (atrasados == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final decenasMapList = atrasados['general']!.decenas.entries.toList()
            ..sort((a, b) => b.value.compareTo(a.value));
          final decenas =
              decenasMapList.map((e) => e.key).toList().sublist(0, 8);

          return Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    result.fecha.toString().split(' ')[0],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/cruz/Monedas.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          'assets/cruz/Treboles.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          'assets/cruz/Trebol.png',
                          fit: BoxFit.cover,
                        )
                            .animate(
                              onPlay: (controller) => controller.repeat(
                                  period: const Duration(seconds: 1),
                                  reverse: true),
                            )
                            .scale(
                              begin: const Offset(1, 1),
                              end: const Offset(1.02, 1.02),
                              curve: Curves.easeInOut,
                            ),
                      ),
                      Center(
                        child: CustomPaint(
                          size: const Size(400, 400),
                          painter: CircleWithDiagonalsPainter(numbers: decenas),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CruzSuerte extends StatelessWidget {
  const CruzSuerte({super.key, required this.numbers});

  final List<String> numbers;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CircleWithDiagonalsPainter extends CustomPainter {
  CircleWithDiagonalsPainter({required this.numbers});

  final List<String> numbers;

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    final offsets = [
      /* ------------------------CORNERS------------------------ */
      Offset(
        size.width / 4 - 10,
        size.height / 4 - 20,
      ), // top left
      Offset(
        size.width - size.width / 4 - 10,
        size.height / 4 - 20,
      ), // top right
      Offset(
        size.width - size.width / 4 - 10,
        size.height - size.height / 4 - 20,
      ), // bottom right
      Offset(
        size.width / 4 - 10,
        size.height - size.height / 4 - 20,
      ), // bottom left
      /* ------------------------CENTER------------------------ */
      Offset(
        centerX - (centerX / 2.7),
        centerY - 20,
      ), // left
      Offset(
        centerX + (centerX / 2.7) - 25,
        centerY - 20,
      ), // right
      Offset(
        centerX - 10,
        centerY - (centerY / 4) - 20,
      ), // top
      Offset(
        centerX - 10,
        centerY + (centerY / 4) - 20,
      ), // bottom
    ];

    for (var i = 0; i < offsets.length; i++) {
      TextSpan textSpan = TextSpan(
        text: numbers[i],
        style: TextStyle(
          fontSize: 32,
          color: i < 4 ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Merienda',
        ),
      );
      TextPainter textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, offsets[i]);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
