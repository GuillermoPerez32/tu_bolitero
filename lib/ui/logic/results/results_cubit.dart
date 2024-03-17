import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tu_bolitero/data/datasources/lottery_result_datasource.dart';
import 'package:tu_bolitero/domain/models/lottery_result.dart';

part 'results_state.dart';
part 'results_cubit.freezed.dart';

class ResultsCubit extends Cubit<ResultsState> {
  ResultsCubit() : super(const ResultsState.initial(results: {}));

  void setLoading() {
    emit(ResultsState.loading(results: state.results));
  }

  void loadLotteryResults(int lotteryId) async {
    try {
      final results =
          await lotteryResultsDatasource.getLotteryResult(lotteryId);
      emit(
        ResultsState.loaded(
          results: Map.from(state.results)..addAll({'$lotteryId': results}),
        ),
      );
    } catch (e) {
      emit(ResultsState.error(results: state.results, reason: e.toString()));
    }
  }
}
