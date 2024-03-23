import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tu_bolitero/data/datasources/lottery_datasource.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';

part 'lottery_state.dart';
part 'lottery_cubit.freezed.dart';

class LotteryCubit extends Cubit<LotteryState> {
  LotteryCubit() : super(const LotteryState.initial([]));

  void setLoading() {
    emit(LotteryState.loading(state.lotteries));
  }

  void loadLotteries() async {
    emit(LotteryState.loading(state.lotteries));
    final lotteries = await lotteryDatasource.getLotteries();
    emit(LotteryState.loaded(lotteries));
  }

  void loadLotteryResults(int lotteryId) async {
    try {
      final results = await lotteryDatasource.getLotteryResult(lotteryId);
      final newLottery = state.lotteries
          .firstWhere((element) => element.id == lotteryId)
          .copyWith(anteriores: results);
      final editableLotteries = List<Lottery>.from(state.lotteries);
      final oldLotteryId =
          editableLotteries.indexWhere((element) => element.id == lotteryId);
      editableLotteries[oldLotteryId] = newLottery;
      emit(
        LotteryState.loaded(editableLotteries),
      );
    } catch (e) {
      emit(LotteryState.error(state.lotteries, e.toString()));
    }
  }

  void loadLotteryAtrasados(int lotteryId) async {
    final results = await lotteryDatasource.getAtrasados(lotteryId);
    final newLottery = state.lotteries
        .firstWhere((element) => element.id == lotteryId)
        .copyWith(atrasados: results);
    final editableLotteries = List<Lottery>.from(state.lotteries);
    final oldLotteryId =
        editableLotteries.indexWhere((element) => element.id == lotteryId);
    editableLotteries[oldLotteryId] = newLottery;
    emit(
      LotteryState.loaded(editableLotteries),
    );
  }
}
