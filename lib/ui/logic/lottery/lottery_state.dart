part of 'lottery_cubit.dart';

@freezed
class LotteryState with _$LotteryState {
  const factory LotteryState.initial(
          List<Lottery> lotteries, Map<String, List<ResultComment>> comments) =
      _Initial;
  const factory LotteryState.loading(
          List<Lottery> lotteries, Map<String, List<ResultComment>> comments) =
      _Loading;
  const factory LotteryState.loaded(
          List<Lottery> lotteries, Map<String, List<ResultComment>> comments) =
      _Loaded;
  const factory LotteryState.error(List<Lottery> lotteries,
      Map<String, List<ResultComment>> comments, String reason) = _Error;
}
