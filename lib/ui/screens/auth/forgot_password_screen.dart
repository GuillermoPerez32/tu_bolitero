import 'package:flutter/material.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BoliteroAppBar(
        title: Text('Recuperar Contraseña'),
      ),
      body: Center(
        child: Text('Pantalla de Recuperar Contraseña'),
      ),
    );
  }
}
