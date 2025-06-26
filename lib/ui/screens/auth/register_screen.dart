import 'package:flutter/material.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BoliteroAppBar(
        title: Text('Registro'),
      ),
      body: Center(
        child: Text('Pantalla de Registro'),
      ),
    );
  }
}
