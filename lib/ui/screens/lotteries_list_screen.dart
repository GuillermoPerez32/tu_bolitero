import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';
import 'package:tu_bolitero/ui/widgets/lottery_tile.dart';

class LotteriesListScreen extends StatelessWidget {
  const LotteriesListScreen({
    super.key,
    required this.onLotterySelected,
    required this.selectedIndex,
  });

  final Function(String) onLotterySelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BoliteroAppBar(
        title: Text('Loterías'),
      ),
      bottomNavigationBar: BottomBar(index: selectedIndex),
      body: BlocBuilder<LotteryCubit, LotteryState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(top: 12),
            child: ListView.separated(
              itemCount: state.lotteries.length,
              itemBuilder: (context, index) {
                return LotteryTile(
                  title: state.lotteries[index].nombre,
                  imageSrc: state.lotteries[index].logo,
                  onTap: () =>
                      onLotterySelected('${state.lotteries[index].id}'),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
            ),
          );
        },
      ),
    );
  }
}
