import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';
import 'package:tu_bolitero/ui/widgets/result_card.dart';

class AnterioresPerDay {
  final DateTime fecha;
  final List<LotteryResult> results;

  AnterioresPerDay({
    required this.fecha,
    required this.results,
  });
}

class ResultDetailScreen extends StatelessWidget {
  const ResultDetailScreen({super.key, required this.lotteryId});

  final String? lotteryId;

  @override
  Widget build(BuildContext context) {
    final lotteryBloc = BlocProvider.of<LotteryCubit>(context);

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

              final anterioresPerDay = lottery.anteriores
                  .map((result) => AnterioresPerDay(
                        fecha: result.fecha,
                        results: lottery.anteriores
                            .where((element) =>
                                element.fecha.day == result.fecha.day &&
                                element.fecha.month == result.fecha.month &&
                                element.fecha.year == result.fecha.year)
                            .toList(),
                      ))
                  .toList();

              return Center(
                child: ListView.builder(
                  itemCount: anterioresPerDay.length,
                  itemBuilder: (context, index) {
                    final result = anterioresPerDay[index];
                    return ResultCard(
                      results: result.results,
                      lotteryId: lotteryId!,
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
