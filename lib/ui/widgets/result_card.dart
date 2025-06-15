import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';

class ResultCard extends StatelessWidget {
  final String lotteryId;

  const ResultCard({
    super.key,
    required this.results,
    required this.lotteryId,
  });

  final List<LotteryResult> results;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      DateFormat.E().format(results.first.fecha),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      DateFormat('d').format(results.first.fecha),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      DateFormat('MM/yyyy').format(results.first.fecha),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 5),
                Container(
                  width: 2,
                  height: 110,
                  color: const Color.fromRGBO(243, 242, 242, 1),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    children: results.map((result) {
                      final isDay =
                          result.fecha.hour > 6 && result.fecha.hour < 18;

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage(isDay
                                  ? 'assets/sun.png'
                                  : 'assets/moon.png')),
                          const SizedBox(width: 10),
                          PickSection(title: "Pick 3", value: result.pick3),
                          const SizedBox(width: 20),
                          PickSection(title: "Pick 4", value: result.pick4),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PickSection extends StatelessWidget {
  const PickSection({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        const SizedBox(height: 5),
        Row(
          children: value.split('').map((char) {
            return Container(
              height: 24,
              width: 24,
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                child: Text(
                  char,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
