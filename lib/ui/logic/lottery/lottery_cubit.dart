import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tu_bolitero/data/datasources/lottery_datasource.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';

part 'lottery_state.dart';
part 'lottery_cubit.freezed.dart';

class LotteryCubit extends Cubit<LotteryState> {
  LotteryCubit() : super(LotteryState.initial());

  void loadLotteries() async {
    emit(const LotteryState.loading());
    try {
      final lotteries = await lotteryDatasource.getLotteries();
      emit(LotteryState.loaded(lotteries));
    } catch (e) {
      emit(const LotteryState.error());
    }
  }
}
