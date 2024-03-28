import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/ui/logic/charada_clasica/charada_clasica_cubit.dart';

class CharadaClasicaScreen extends StatelessWidget {
  const CharadaClasicaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charada Clásica'),
      ),
      body: BlocBuilder<CharadaClasicaCubit, CharadaClasicaState>(
        builder: (context, state) {
          return state.maybeWhen(
              orElse: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
              loaded: (charadaNumbers) => ListView.builder(
                    itemBuilder: (context, index) {
                      final charadaNumber = charadaNumbers[index];
                      return ListTile(
                        title: Text(charadaNumber.principal),
                      );
                    },
                    itemCount: charadaNumbers.length,
                  ));
        },
      ),
    );
  }
}
