import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tu_bolitero/data/datasources/charada_clasica_datasource.dart';
import 'package:tu_bolitero/domain/models/charada_number.dart';

part 'charada_clasica_state.dart';
part 'charada_clasica_cubit.freezed.dart';

class CharadaClasicaCubit extends Cubit<CharadaClasicaState> {
  CharadaClasicaCubit() : super(const CharadaClasicaState.initial([], []));

  CharadaClasicaDatasource datasource = const CharadaClasicaDatasource();

  void loadCharada() async {
    emit(CharadaClasicaState.loading(state.numbers, state.filteredNumbers));
    final charada = await datasource.getCharadaClasica();
    emit(CharadaClasicaState.loaded(charada, charada));
  }

  void filterCharada(String value) {
    final lowerValue = value.toLowerCase();
    final filteredCharada = state.numbers
        .where(
          (element) =>
              element.number.toLowerCase().contains(lowerValue) ||
              element.principal.toLowerCase().contains(lowerValue) ||
              element.meanings
                  .any((element) => element.toLowerCase().contains(lowerValue)),
        )
        .toList();
    emit(CharadaClasicaState.loaded(state.numbers, filteredCharada));
  }
}
