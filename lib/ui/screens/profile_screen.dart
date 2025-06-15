import 'package:flutter/material.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      bottomNavigationBar: const BottomBar(index: 3),
      body: const Center(
        child: Text('Pantalla de Perfil'),
      ),
    );
  }
}
