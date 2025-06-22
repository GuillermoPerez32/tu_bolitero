import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/core/router.dart';
import 'package:tu_bolitero/core/theme.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tu Bolitero',
      routerConfig: router,
      theme: ThemeFactory.getTheme(context),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return BlocListener<LotteryCubit, LotteryState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              error: (_, reason) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(reason)),
                );
              },
            );
          },
          child: child!,
        );
      },
    );
  }
}
