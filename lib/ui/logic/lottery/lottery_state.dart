part of 'lottery_cubit.dart';

@freezed
class LotteryState with _$LotteryState {
  const factory LotteryState.initial() = _Initial;
  const factory LotteryState.loading() = _Loading;
  const factory LotteryState.loaded(List<Lottery> lotteries) = _Loaded;
  const factory LotteryState.error() = _Error;
}
