import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/domain/models/charada_number.dart';
import 'package:tu_bolitero/ui/logic/charada_clasica/charada_clasica_cubit.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';

class CharadaClasicaScreen extends StatelessWidget {
  CharadaClasicaScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final charadaClasicaBloc = BlocProvider.of<CharadaClasicaCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Charada Clásica'),
      ),
      bottomNavigationBar: const BottomBar(index: 2),
      body: BlocBuilder<CharadaClasicaCubit, CharadaClasicaState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 12),
                TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    charadaClasicaBloc.filterCharada(value);
                  },
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide.none,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Buscar',
                    filled: true,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                            },
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 12),
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
                                  return _CharadaTile(
                                      charadaNumber: charadaNumber);
                                },
                                itemCount: filteredCharada.length,
                              ),
                            ));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CharadaTile extends StatelessWidget {
  const _CharadaTile({
    required this.charadaNumber,
  });

  final CharadaNumber charadaNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 90,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  charadaNumber.number,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        charadaNumber.principal,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        charadaNumber.meanings.join(' - '),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
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
