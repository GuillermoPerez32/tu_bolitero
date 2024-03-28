part of 'charada_clasica_cubit.dart';

@freezed
class CharadaClasicaState with _$CharadaClasicaState {
  const factory CharadaClasicaState.initial(
          List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers) =
      _Initial;
  const factory CharadaClasicaState.loading(
          List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers) =
      _Loading;
  const factory CharadaClasicaState.loaded(
          List<CharadaNumber> numbers, List<CharadaNumber> filteredNumbers) =
      _Loaded;
}
