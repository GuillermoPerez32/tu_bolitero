part of 'charada_clasica_cubit.dart';

@freezed
class CharadaClasicaState with _$CharadaClasicaState {
  const factory CharadaClasicaState.initial() = _Initial;
  const factory CharadaClasicaState.loading() = _Loading;
  const factory CharadaClasicaState.loaded(List<CharadaNumber> numbers) =
      _Loaded;
}
