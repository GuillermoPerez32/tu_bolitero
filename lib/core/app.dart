import 'package:flutter/material.dart';
import 'package:tu_bolitero/core/router.dart';
import 'package:tu_bolitero/core/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tu Bolitero',
      routerConfig: router,
      theme: defaultTheme,
    );
  }
}
