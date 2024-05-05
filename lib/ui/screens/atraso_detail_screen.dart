import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';

class AtrasoDetailScreen extends StatelessWidget {
  const AtrasoDetailScreen({super.key, required this.lotteryId});

  final String? lotteryId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LotteryCubit, LotteryState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: state.maybeWhen(
              orElse: () => Container(),
              loaded: (lotteries) {
                final lotteryName = lotteries
                    .firstWhere((element) => '${element.id}' == lotteryId)
                    .nombre;
                return Text('Atrasados $lotteryName');
              },
            ),
            actions: state.maybeWhen(
              orElse: () => [],
              loaded: (lotteries) {
                final lottery = lotteries
                    .where((element) => '${element.id}' == lotteryId)
                    .toList()[0];
                return [
                  Hero(
                    tag: lottery.logo,
                    child: CircleAvatar(
                      backgroundImage:
                          CachedNetworkImageProvider(host + lottery.logo),
                    ),
                  ),
                ];
              },
            ),
          ),
          body: state.maybeWhen(
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
              if (atrasados == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListView(
                  children: horarios.map(
                    (horario) {
                      if (atrasados[horario] == null) return Container();
                      final centenas = atrasados[horario]!
                          .centenas
                          .entries
                          .toList()
                        ..sort((a, b) => b.value.compareTo(a.value));
                      final decenas = atrasados[horario]!
                          .decenas
                          .entries
                          .toList()
                        ..sort((a, b) => b.value.compareTo(a.value));
                      final unidades = atrasados[horario]!
                          .unidades
                          .entries
                          .toList()
                        ..sort((a, b) => b.value.compareTo(a.value));
                      if (centenas.isEmpty &&
                          decenas.isEmpty &&
                          unidades.isEmpty) {
                        return const Center(
                          child: Text('No hay datos de atrasados'),
                        );
                      }
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Text(
                              horario.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const TitleText(title: "Centena"),
                                ]..addAll(centenas.map(
                                    (e) => NumberBall(
                                      value: e.key,
                                      centena: '${e.value} días',
                                      color: const Color.fromARGB(
                                          220, 255, 198, 198),
                                    ),
                                  )),
                              ),
                              Column(
                                children: [const TitleText(title: "Decena")]
                                  ..addAll(decenas.map(
                                    (e) => NumberBall(
                                      value: e.key,
                                      decena: '${e.value} días',
                                      color: const Color.fromARGB(
                                          220, 255, 235, 132),
                                    ),
                                  )),
                              ),
                              Column(
                                children: [const TitleText(title: "Terminal")]
                                  ..addAll(unidades.map(
                                    (e) => NumberBall(
                                      value: e.key,
                                      unidad: '${e.value} días',
                                      color: const Color.fromARGB(
                                          220, 156, 190, 255),
                                    ),
                                  )),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ).toList(),
                ),
              );
            },
            orElse: () => Container(),
          ),
        );
      },
    );
  }
}

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
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
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ballText =
        '${centena != null ? value : 'x'}${decena != null ? value : 'x'}${unidad != null ? value : 'x'}';
    final atraso = (centena ?? (decena ?? unidad))!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
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
