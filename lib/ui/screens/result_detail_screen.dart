import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';

class ResultDetailScreen extends StatelessWidget {
  const ResultDetailScreen({super.key, required this.lotteryId});

  final String? lotteryId;

  @override
  Widget build(BuildContext context) {
    final lotteryBloc = BlocProvider.of<LotteryCubit>(context);
    final firstColor = [
      const Color.fromARGB(255, 84, 181, 222),
      Colors.white,
    ];

    final secondColor = [
      const Color.fromARGB(255, 228, 184, 255),
      Colors.white,
    ];

    return BlocBuilder<LotteryCubit, LotteryState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: state.maybeWhen(
              orElse: () => [],
              loaded: (lotteries) {
                final lottery = lotteries
                    .where((element) => '${element.id}' == lotteryId)
                    .toList()[0];
                return [
                  Hero(
                    tag: lottery.logo,
                    child: CircleAvatar(
                      backgroundImage:
                          CachedNetworkImageProvider(host + lottery.logo),
                    ),
                  ),
                ];
              },
            ),
            title: state.maybeWhen(
              orElse: () => Container(),
              loaded: (lotteries) {
                final lotteryName = lotteries
                    .firstWhere((element) => '${element.id}' == lotteryId)
                    .nombre;
                return Text('$lotteryName Pick');
              },
            ),
          ),
          body: state.maybeWhen(
            error: (_, reason) => Center(
              child: Text('Error: $reason'),
            ),
            loading: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            orElse: () {
              final lotteries = state.lotteries
                  .where(
                    (element) => '${element.id}' == lotteryId,
                  )
                  .toList();

              if (lotteries.isEmpty) {
                return const Center(
                  child: Text('No hay resultados'),
                );
              }

              final lottery = lotteries[0];

              return Center(
                child: ListView.builder(
                  itemCount: lottery.anteriores.length,
                  itemBuilder: (context, index) {
                    final result = lottery.anteriores[index];
                    return ResultCard(
                      result: result,
                      gradientColors: index % 2 == 0 ? firstColor : secondColor,
                    );
                  },
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (lotteryId != null) {
                lotteryBloc.setLoading();
                lotteryBloc.loadLotteryResults(int.parse(lotteryId!));
              }
            },
            child: const Icon(Icons.refresh),
          ),
        );
      },
    );
  }
}

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.result,
    required this.gradientColors,
  });

  final LotteryResult result;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(top: 20, bottom: 40, left: 20, right: 20),
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [.2, .6],
          colors: gradientColors,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  DateFormat.EEEE().format(result.fecha),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                Image.asset(result.fecha.hour > 6 && result.fecha.hour < 14
                    ? 'assets/sun.png'
                    : 'assets/moon.png'),
                Text(
                  DateFormat('dd-MM-yyyy').format(result.fecha),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PickSection(
                  pickNumber: '3',
                  pickResult: result.pick3,
                  color: const Color.fromARGB(220, 255, 214, 0),
                ),
                const SizedBox(height: 20),
                PickSection(
                  pickNumber: '4',
                  pickResult: result.pick4,
                  color: const Color.fromARGB(240, 164, 239, 128),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PickSection extends StatelessWidget {
  const PickSection({
    super.key,
    required this.pickNumber,
    required this.pickResult,
    required this.color,
  });

  final String pickNumber;
  final String pickResult;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Pick',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Container(
              margin: const EdgeInsets.only(left: 10),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Text(
                pickNumber,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
            ),
          ],
        ),
        Text(
          pickResult,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
