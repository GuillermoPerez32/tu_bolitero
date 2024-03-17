import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tu_bolitero/domain/models/lottery_result.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';
import 'package:tu_bolitero/ui/logic/results/results_cubit.dart';

class ResultDetailScreen extends StatelessWidget {
  const ResultDetailScreen({super.key, required this.lotteryId});

  final String? lotteryId;

  @override
  Widget build(BuildContext context) {
    final resultsBloc = BlocProvider.of<ResultsCubit>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                if (lotteryId != null) {
                  resultsBloc.setLoading();
                  resultsBloc.loadLotteryResults(int.parse(lotteryId!));
                }
              },
              icon: const Icon(Icons.refresh))
        ],
        title: BlocBuilder<LotteryCubit, LotteryState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => Container(),
              loaded: (lotteries) {
                final lotteryName = lotteries
                    .firstWhere((element) => '${element.id}' == lotteryId)
                    .nombre;
                return Text('$lotteryName Pick');
              },
            );
          },
        ),
      ),
      body: BlocBuilder<ResultsCubit, ResultsState>(
        builder: (context, state) {
          return state.maybeWhen(
            error: (_, reason) => Center(
              child: Text('Error: $reason'),
            ),
            loading: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            orElse: () => state.results[lotteryId] == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.results[lotteryId]!.isEmpty
                    ? const Center(
                        child: Text('No hay resultados'),
                      )
                    : Center(
                        child: ListView.builder(
                          itemCount: state.results[lotteryId]!.length,
                          itemBuilder: (context, index) {
                            final result = state.results[lotteryId]![index];
                            return ResultCard(result: result);
                          },
                        ),
                      ),
          );
        },
      ),
    );
  }
}

//TODO: #1 Finish to style card
class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.result,
  });

  final LotteryResult result;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(top: 20, bottom: 40, left: 20, right: 20),
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
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
          stops: [.2, .6],
          colors: [
            Color.fromARGB(255, 84, 181, 222),
            Colors.white,
          ],
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
                Image.asset('assets/sun.png'),
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
