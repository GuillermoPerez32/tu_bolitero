import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tu_bolitero/ui/logic/luck/luck_state.dart';

class LuckCubit extends Cubit<LuckState> {
  LuckCubit() : super(LuckState());

  SharedPreferences? _prefs;

  void buildLuck() async {
    _prefs ??= await SharedPreferences.getInstance();
    // buscar luck y date en shared preferences
    final luck = _prefs!.getString('luck');
    final date = _prefs!.getString('date');

    // si no existe, generar un nuevo luck y date
    if (luck == null || date == null) {
      generateLuck();
      return;
    }

    // si existe, verificar si el date es de hoy
    final now = DateFormat('yyyy-MM-dd').format(DateTime.now());
    if (date == now) {
      // si es de hoy, retornar el luck
      emit(LuckState(luck: luck));
      return;
    }
    // si no es de hoy, generar un nuevo luck y date
    generateLuck();
  }

  void generateLuck() {
    final random = Random();
    final newLuck = random.nextInt(1000).toString().padLeft(3, '0');
    final newDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _prefs!.setString('luck', newLuck.toString());
    _prefs!.setString('date', newDate);
    emit(LuckState(luck: newLuck.toString()));
  }
}
