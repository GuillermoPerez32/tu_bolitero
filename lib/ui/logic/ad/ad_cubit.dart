import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tu_bolitero/data/datasources/ad_datasource.dart';
import 'package:tu_bolitero/domain/models/ad.dart';

part 'ad_state.dart';
part 'ad_cubit.freezed.dart';

class AdCubit extends Cubit<AdState> {
  AdCubit() : super(const AdState.initial());

  void loadAd() async {
    emit(const AdState.loading());
    final ad = await adDatasource.getAd();
    emit(AdState.loaded(ad));
  }
}
