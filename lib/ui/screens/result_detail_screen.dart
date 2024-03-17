import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';
import 'package:tu_bolitero/ui/logic/results/results_cubit.dart';

class ResultDetailScreen extends StatelessWidget {
  const ResultDetailScreen({super.key, required this.lotteryId});

  final String? lotteryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          print(state.results.length);
          return state.maybeWhen(
            error: (_, reason) => Center(
              child: Text('Error: $reason'),
            ),
            orElse: () => state.results[lotteryId] == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.results[lotteryId]!.isEmpty
                    ? const Center(
                        child: Text('No hay resultados'),
                      )
                    : ListView.builder(
                        itemCount: state.results[lotteryId]!.length,
                        itemBuilder: (context, index) {
                          final result = state.results[lotteryId]![index];
                          return ListTile(
                            title: Text('${result.fecha.day}'),
                            subtitle: Column(
                              children: [
                                Text(result.pick3),
                                Text(result.pick4),
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
}
