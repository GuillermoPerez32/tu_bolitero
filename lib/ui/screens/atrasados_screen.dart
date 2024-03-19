import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';
import 'package:tu_bolitero/ui/logic/results/results_cubit.dart';
import 'package:tu_bolitero/ui/widgets/lottery_tile.dart';

class AtrasadosScreen extends StatelessWidget {
  const AtrasadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atrasados'),
      ),
      body: BlocBuilder<LotteryCubit, LotteryState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: Text('Esperando loterias'),
            ),
            loading: () => const Center(
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
                    BlocProvider.of<ResultsCubit>(context)
                        .loadLotteryResults(lottery.id);
                    //TODO: Fix
                    context.go('/atrasados/${lottery.id}');
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
            error: () => const Center(
              child: Text('Error'),
            ),
          );
        },
      ),
    );
  }
}
