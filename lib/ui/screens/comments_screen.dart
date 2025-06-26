import 'package:flutter/material.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';

class CommentsScreen extends StatelessWidget {
  final String postId;
  const CommentsScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BoliteroAppBar(
        title: Text('Comentarios del Post $postId'),
      ),
      body: const Center(
        child: Text('Pantalla de Comentarios'),
      ),
    );
  }
}
