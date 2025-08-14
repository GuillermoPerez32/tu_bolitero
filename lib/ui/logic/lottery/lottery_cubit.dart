import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tu_bolitero/data/datasources/lottery_datasource.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';

part 'lottery_state.dart';
part 'lottery_cubit.freezed.dart';

class LotteryCubit extends Cubit<LotteryState> {
  LotteryCubit() : super(const LotteryState.initial([], {}));

  void setLoading() {
    emit(LotteryState.loading(state.lotteries, state.comments));
  }

  void loadLotteries() async {
    emit(LotteryState.loading(state.lotteries, state.comments));
    final lotteries = await lotteryDatasource.getLotteries();
    emit(LotteryState.loaded(lotteries, state.comments));
    for (final lottery in lotteries) {
      loadLotteryResults(lottery.id);
      loadLotteryAtrasados(lottery.id);
    }
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
        LotteryState.loaded(editableLotteries, state.comments),
      );
    } catch (e) {
      emit(LotteryState.error(state.lotteries, state.comments, e.toString()));
    }
  }

  void loadLotteryAtrasados(int lotteryId) async {
    try {
      final results = await lotteryDatasource.getAtrasados(lotteryId);
      final newLottery = state.lotteries
          .firstWhere((element) => element.id == lotteryId)
          .copyWith(atrasados: results);
      final editableLotteries = List<Lottery>.from(state.lotteries);
      final oldLotteryId =
          editableLotteries.indexWhere((element) => element.id == lotteryId);
      editableLotteries[oldLotteryId] = newLottery;
      emit(
        LotteryState.loaded(editableLotteries, state.comments),
      );
    } catch (e) {
      emit(LotteryState.error(state.lotteries, state.comments, e.toString()));
    }
  }

  // ----- Likes on results -----
  void likeResult(int resultId, int lotteryId) async {
    try {
      emit(LotteryState.loading(state.lotteries, state.comments));
      await lotteryDatasource.likeResult(resultId);
      // Reload results to refresh counts
      loadLotteryResults(lotteryId);
      emit(LotteryState.loaded(state.lotteries, state.comments));
    } catch (e) {
      emit(LotteryState.error(state.lotteries, state.comments, e.toString()));
    }
  }

  void unlikeResult(int resultId, int lotteryId) async {
    try {
      emit(LotteryState.loading(state.lotteries, state.comments));
      await lotteryDatasource.unlikeResult(resultId);
      loadLotteryResults(lotteryId);
      emit(LotteryState.loaded(state.lotteries, state.comments));
    } catch (e) {
      emit(LotteryState.error(state.lotteries, state.comments, e.toString()));
    }
  }

  void addResultComment(int resultId, String comment, int lotteryId) async {
    try {
      emit(LotteryState.loading(state.lotteries, state.comments));
      await lotteryDatasource.addResultComment(resultId, comment);
      loadLotteryResults(lotteryId);
      emit(LotteryState.loaded(state.lotteries, state.comments));
    } catch (e) {
      emit(LotteryState.error(state.lotteries, state.comments, e.toString()));
    }
  }

  void loadResultComments(int resultId) async {
    try {
      emit(LotteryState.loading(state.lotteries, state.comments));
      final comments = await lotteryDatasource.getResultComments(resultId);
      final editableComments =
          Map<String, List<ResultComment>>.from(state.comments);
      editableComments[resultId.toString()] = comments;
      emit(
        LotteryState.loaded(state.lotteries, editableComments),
      );
    } catch (e) {
      emit(LotteryState.error(state.lotteries, state.comments, e.toString()));
    }
  }
}
