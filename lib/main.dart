import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/core/app.dart';
import 'package:tu_bolitero/ui/logic/ad/ad_cubit.dart';
import 'package:tu_bolitero/ui/logic/apk_info/apk_info_cubit.dart';
import 'package:tu_bolitero/ui/logic/auth/auth_cubit.dart';
import 'package:tu_bolitero/ui/logic/charada_clasica/charada_clasica_cubit.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';
import 'package:tu_bolitero/ui/logic/luck/luck_cubit.dart';
import 'package:tu_bolitero/ui/logic/post/post_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LotteryCubit()..loadLotteries(),
        ),
        BlocProvider(
          create: (context) => CharadaClasicaCubit()..loadCharada(),
        ),
        BlocProvider(
          create: (context) => AdCubit()..loadAd(),
        ),
        BlocProvider(
          create: (context) => ApkInfoCubit()..checkVersion(),
        ),
        BlocProvider(
          create: (context) => LuckCubit(),
        ),
        BlocProvider(
          create: (context) => PostCubit()
            ..loadPosts()
            ..loadFollowedPosts(),
        ),
        BlocProvider(
          create: (context) => AuthCubit()..loadLocalUser(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
