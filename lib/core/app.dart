import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      // Localization setup (provides MaterialLocalizations required by dialogs)
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es'),
        Locale('en'),
      ],
      builder: (context, child) {
        return Container(
          color: Theme.of(context).scaffoldBackgroundColor.withValues(
                alpha: 0.9,
              ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              child: BlocListener<LotteryCubit, LotteryState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    error: (_, comments, reason) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(reason)),
                      );
                    },
                  );
                },
                child: child!,
              ),
            ),
          ),
        );
      },
    );
  }
}
