part of 'lottery_cubit.dart';

@freezed
class LotteryState with _$LotteryState {
  const factory LotteryState.initial(List<Lottery> lotteries) = _Initial;
  const factory LotteryState.loading(List<Lottery> lotteries) = _Loading;
  const factory LotteryState.loaded(List<Lottery> lotteries) = _Loaded;
  const factory LotteryState.error(List<Lottery> lotteries, String reason) =
      _Error;
}
