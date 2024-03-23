import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';

class AtrasoDetailScreen extends StatelessWidget {
  const AtrasoDetailScreen({super.key, required this.lotteryId});

  final String? lotteryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<LotteryCubit, LotteryState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => Container(),
              loaded: (lotteries) {
                final lotteryName = lotteries
                    .firstWhere((element) => '${element.id}' == lotteryId)
                    .nombre;
                return Text('Atrasados $lotteryName');
              },
            );
          },
        ),
      ),
      body: BlocBuilder<LotteryCubit, LotteryState>(
        builder: (context, state) {
          return state.maybeWhen(
            error: (_, reason) => Center(
              child: Text('Error: $reason'),
            ),
            loading: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (lotteries) {
              final lottery = lotteries
                  .firstWhere((element) => '${element.id}' == lotteryId);
              final atrasados = lottery.atrasados;
              final centenas = atrasados?.centenas;
              final decenas = atrasados?.decenas;
              final unidades = atrasados?.unidades;
              if (atrasados == null ||
                  centenas!.isEmpty ||
                  decenas!.isEmpty ||
                  unidades!.isEmpty) {
                return Center(
                  child: Text('No hay datos de atrasados'),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NumberBall(
                            value: index,
                            centena: centenas['$index'] != null
                                ? '${centenas['$index']} días'
                                : 'No hay',
                            color: Color.fromARGB(220, 255, 198, 198),
                          ),
                          NumberBall(
                            value: index,
                            decena: decenas['$index'] != null
                                ? '${decenas['$index']} días'
                                : 'No hay',
                            color: Color.fromARGB(220, 255, 235, 132),
                          ),
                          NumberBall(
                            value: index,
                            unidad: unidades['$index'] != null
                                ? '${unidades['$index']} días'
                                : 'No hay',
                            color: Color.fromARGB(220, 156, 190, 255),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            orElse: () => Container(),
          );
        },
      ),
    );
  }
}

class NumberBall extends StatelessWidget {
  const NumberBall({
    super.key,
    this.centena,
    this.decena,
    this.unidad,
    required this.color,
    required this.value,
  }) : assert(centena != null || decena != null || unidad != null);

  final String? centena;
  final String? decena;
  final String? unidad;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final titleText = centena != null
        ? 'Centena'
        : decena != null
            ? "Decena"
            : "Terminal";
    final ballText =
        '${centena != null ? value : 'x'}${decena != null ? value : 'x'}${unidad != null ? value : 'x'}';
    final atraso = (centena != null
        ? centena
        : decena != null
            ? decena
            : unidad)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(titleText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Text(
              ballText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            atraso,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
