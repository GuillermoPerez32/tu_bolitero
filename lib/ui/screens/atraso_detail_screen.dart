import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';

class AtrasoDetailScreen extends StatefulWidget {
  const AtrasoDetailScreen({super.key, required this.lotteryId});

  final String? lotteryId;

  @override
  State<AtrasoDetailScreen> createState() => _AtrasoDetailScreenState();
}

class _AtrasoDetailScreenState extends State<AtrasoDetailScreen> {
  // ──────────────────────────── STATE ────────────────────────────
  String selectedGrupo = 'general';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LotteryCubit, LotteryState>(
      builder: (context, state) {
        return Scaffold(
          appBar: BoliteroAppBar(
            title: state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loaded: (lotteries) {
                final lotteryName = lotteries
                    .firstWhere((e) => '${e.id}' == widget.lotteryId)
                    .nombre;
                return Text('Atrasados $lotteryName');
              },
            ),
            actions: state.maybeWhen(
              orElse: () => [],
              loaded: (lotteries) {
                final lottery =
                    lotteries.firstWhere((e) => '${e.id}' == widget.lotteryId);
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
            loading: (_) => const Center(child: CircularProgressIndicator()),
            error: (_, reason) => Center(
                child: Text('Error: $reason', textAlign: TextAlign.center)),
            loaded: (lotteries) {
              final lottery =
                  lotteries.firstWhere((e) => '${e.id}' == widget.lotteryId);
              final atrasados = lottery.atrasados;

              if (atrasados == null) {
                return const Center(child: CircularProgressIndicator());
              }

              // ────────────────────────── UI ──────────────────────────
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Wrap(
                        spacing: 8,
                        children: atrasados.keys.map((horario) {
                          return ChoiceChip(
                            label: Text(horario.toUpperCase()),
                            selected: selectedGrupo == horario,
                            onSelected: (_) => setState(() {
                              selectedGrupo = horario;
                            }),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (atrasados[selectedGrupo] == null)
                      const Center(child: Text('No hay datos de atrasados'))
                    else
                      _GrupoAtrasosView(
                        datos: atrasados[selectedGrupo]!,
                        horario: selectedGrupo,
                      ),
                  ],
                ),
              );
            },
            orElse: () => const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}

// ──────────────────────── Vista interna ────────────────────────
class _GrupoAtrasosView extends StatelessWidget {
  const _GrupoAtrasosView({required this.datos, required this.horario});

  final Atrasados datos;
  final String horario;

  @override
  Widget build(BuildContext context) {
    final dobles = datos.dobles.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final centenas = datos.centenas.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final decenas = datos.decenas.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final unidades = datos.unidades.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (centenas.isEmpty && decenas.isEmpty && unidades.isEmpty) {
      return const Center(child: Text('No hay datos de atrasados'));
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Column(
          children: [
            Text(
              horario.toUpperCase(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ColNumeros(
                  titulo: 'Doble',
                  pares: dobles,
                  color: const Color.fromARGB(255, 232, 168, 235),
                  tipo: _TipoAtraso.doble,
                ),
                _ColNumeros(
                  titulo: 'Centena',
                  pares: centenas,
                  color: const Color.fromARGB(255, 97, 139, 250),
                  tipo: _TipoAtraso.centena,
                ),
                _ColNumeros(
                  titulo: 'Decena',
                  pares: decenas,
                  color: const Color.fromARGB(255, 173, 212, 85),
                  tipo: _TipoAtraso.decena,
                ),
                _ColNumeros(
                  titulo: 'Terminal',
                  pares: unidades,
                  color: const Color.fromARGB(255, 248, 139, 44),
                  tipo: _TipoAtraso.unidad,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────── Column helper ────────────────────────
enum _TipoAtraso { doble, centena, decena, unidad }

class _ColNumeros extends StatelessWidget {
  const _ColNumeros({
    required this.titulo,
    required this.pares,
    required this.color,
    required this.tipo,
  });

  final String titulo;
  final List<MapEntry<String, int>> pares;
  final Color color;
  final _TipoAtraso tipo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleText(title: titulo),
        ...pares.map((e) => NumberBall(
              value: e.key,
              doble: tipo == _TipoAtraso.doble ? '${e.value} días' : null,
              centena: tipo == _TipoAtraso.centena ? '${e.value} días' : null,
              decena: tipo == _TipoAtraso.decena ? '${e.value} días' : null,
              unidad: tipo == _TipoAtraso.unidad ? '${e.value} días' : null,
              color: color,
            )),
      ],
    );
  }
}

// ──────────────────────── Widgets auxiliares ────────────────────────
class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
      );
}

class NumberBall extends StatelessWidget {
  const NumberBall({
    super.key,
    this.doble,
    this.centena,
    this.decena,
    this.unidad,
    required this.color,
    required this.value,
  }) : assert(doble != null ||
            centena != null ||
            decena != null ||
            unidad != null);

  final String? doble;
  final String? centena;
  final String? decena;
  final String? unidad;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    String textoEnBola = '';
    if (doble != null) {
      textoEnBola += 'x${value * 2}';
    }
    if (centena != null) {
      textoEnBola += '${value}xx';
    }
    if (decena != null) {
      textoEnBola += 'x${value}x';
    }
    if (unidad != null) {
      textoEnBola += 'xx$value';
    }
    final atraso = (doble ?? centena ?? decena ?? unidad)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: color,
            child: Text(
              textoEnBola,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            atraso,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
