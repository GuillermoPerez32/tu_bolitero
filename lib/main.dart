import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/core/app.dart';
import 'package:tu_bolitero/ui/logic/charada_clasica/charada_clasica_cubit.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';
import 'package:tu_bolitero/ui/logic/luck/luck_cubit.dart';

void main() => runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LotteryCubit()..loadLotteries(),
        ),
        BlocProvider(
          create: (context) => CharadaClasicaCubit()..loadCharada(),
        ),
        BlocProvider(
          create: (context) => LuckCubit(),
        ),
      ],
      child: const MyApp(),
    ));
