import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/domain/models/charada_number.dart';
import 'package:tu_bolitero/ui/logic/charada_clasica/charada_clasica_cubit.dart';

class CharadaClasicaScreen extends StatelessWidget {
  const CharadaClasicaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final charadaClasicaBloc = BlocProvider.of<CharadaClasicaCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Charada Clásica'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 236, 230, 240),
                  suffixIcon: const Icon(Icons.search),
                  hintStyle: const TextStyle(fontSize: 12),
                  hintText: 'Escribir el significado para ver el numero',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) => charadaClasicaBloc.filterCharada(value),
              ),
            ),
            BlocBuilder<CharadaClasicaCubit, CharadaClasicaState>(
              builder: (context, state) {
                return state.maybeWhen(
                    orElse: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                    loaded: (_, filteredCharada) => Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              final charadaNumber = filteredCharada[index];
                              return _CharadaTile(charadaNumber: charadaNumber);
                            },
                            itemCount: filteredCharada.length,
                          ),
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CharadaTile extends StatelessWidget {
  const _CharadaTile({
    super.key,
    required this.charadaNumber,
  });

  final CharadaNumber charadaNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 80,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(220, 156, 190, 255),
              Color.fromARGB(220, 238, 215, 252),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Color.fromARGB(220, 156, 190, 255),
                child: Text(
                  charadaNumber.number,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        charadaNumber.principal,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        charadaNumber.meanings.join(', '),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
