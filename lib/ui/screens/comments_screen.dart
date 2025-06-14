import 'package:flutter/material.dart';

class CommentsScreen extends StatelessWidget {
  final String postId;
  const CommentsScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comentarios del Post $postId'),
      ),
      body: const Center(
        child: Text('Pantalla de Comentarios'),
      ),
    );
  }
}
