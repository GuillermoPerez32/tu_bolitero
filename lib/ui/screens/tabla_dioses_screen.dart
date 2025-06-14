import 'package:flutter/material.dart';

class TablaDiosesScreen extends StatelessWidget {
  const TablaDiosesScreen({
    super.key,
    required this.lotteryId,
  });

  final String lotteryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tabla de los Dioses',
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: FilledButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const HelpDialog(),
                    );
                  },
                  child: const Text(
                    'Cómo usar la tabla de los dioses?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SingleChildScrollView(
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 30),
                        child: const Image(
                            image: AssetImage("assets/diosestabla.png"))),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HelpDialog extends StatelessWidget {
  const HelpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text(
        'Como usar la tabla de los dioses?',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(
        'Debes sacar los número por el fijo que salio, todos los que rodean ese número',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
