part of 'results_cubit.dart';

@freezed
class ResultsState with _$ResultsState {
  const factory ResultsState.initial({
    required Map<String, List<LotteryResult>> results,
  }) = _Initial;
  const factory ResultsState.loading({
    required Map<String, List<LotteryResult>> results,
  }) = _Loading;
  const factory ResultsState.loaded({
    required Map<String, List<LotteryResult>> results,
  }) = _Loaded;
  const factory ResultsState.error({
    required Map<String, List<LotteryResult>> results,
    required String reason,
  }) = _Error;
}
