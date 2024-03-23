import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';
import 'package:tu_bolitero/ui/widgets/lottery_tile.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados de loterias'),
      ),
      body: BlocBuilder<LotteryCubit, LotteryState>(
        builder: (context, state) {
          return state.when(
            initial: (_) => const Center(
              child: Text('Esperando loterias'),
            ),
            loading: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (lotteries) => ListView.separated(
              itemCount: lotteries.length,
              itemBuilder: (context, index) {
                final lottery = lotteries[index];
                return LotteryTile(
                  title: lottery.nombre,
                  imageSrc: lottery.logo,
                  onTap: () {
                    BlocProvider.of<LotteryCubit>(context)
                        .loadLotteryResults(lottery.id);
                    context.go('/results/${lottery.id}');
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
            error: (_, reason) => Center(
              child: Text('Error: $reason'),
            ),
          );
        },
      ),
    );
  }
}
