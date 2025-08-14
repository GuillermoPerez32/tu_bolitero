import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';
import 'package:tu_bolitero/ui/widgets/result_card.dart';

class AnterioresPerDay {
  final DateTime fecha;
  final List<LotteryResult> results;

  AnterioresPerDay({
    required this.fecha,
    required this.results,
  });
}

class ResultDetailScreen extends StatefulWidget {
  const ResultDetailScreen({super.key, required this.lotteryId});

  final String? lotteryId;

  @override
  State<ResultDetailScreen> createState() => _ResultDetailScreenState();
}

class _ResultDetailScreenState extends State<ResultDetailScreen> {
  final ScrollController _scroll = ScrollController();
  bool _isFabVisible = true;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
  }

  void _onScroll() {
    final isScrollingDown =
        _scroll.position.userScrollDirection == ScrollDirection.reverse;
    final isScrollingUp =
        _scroll.position.userScrollDirection == ScrollDirection.forward;

    if (isScrollingDown && _isFabVisible) {
      setState(() => _isFabVisible = false);
    } else if (isScrollingUp && !_isFabVisible) {
      setState(() => _isFabVisible = true);
    }
  }

  @override
  void dispose() {
    _scroll
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lotteryBloc = BlocProvider.of<LotteryCubit>(context);

    return BlocBuilder<LotteryCubit, LotteryState>(builder: (context, state) {
      return Scaffold(
        bottomNavigationBar: const BottomBar(index: 1),
        appBar: BoliteroAppBar(
          actions: state.maybeWhen(
            orElse: () => [],
            loaded: (lotteries, comments) {
              final lottery = lotteries
                  .where((element) => '${element.id}' == widget.lotteryId)
                  .toList()[0];
              return [
                Hero(
                  tag: lottery.nombre,
                  child: CircleAvatar(
                    backgroundImage:
                        CachedNetworkImageProvider(host + lottery.logo),
                  ),
                ),
              ];
            },
          ),
          title: state.maybeWhen(
            orElse: () => Container(),
            loaded: (lotteries, comments) {
              final lotteryName = lotteries
                  .firstWhere((element) => '${element.id}' == widget.lotteryId)
                  .nombre;
              return Text('$lotteryName Pick');
            },
          ),
        ),
        body: state.maybeWhen(
          error: (_, comments, reason) => Center(
            child: Text('Error: $reason'),
          ),
          loading: (_, comments) => const Center(
            child: CircularProgressIndicator(),
          ),
          orElse: () {
            final lotteries = state.lotteries
                .where(
                  (element) => '${element.id}' == widget.lotteryId,
                )
                .toList();

            if (lotteries.isEmpty) {
              return const Center(
                child: Text('No hay resultados'),
              );
            }

            final lottery = lotteries[0];

            // Agrupar resultados por fecha (sin hora)
            final Map<DateTime, List<LotteryResult>> groupedResults = {};
            for (final result in lottery.anteriores) {
              final date = DateTime(
                result.fecha.year,
                result.fecha.month,
                result.fecha.day,
              );

              if (!groupedResults.containsKey(date)) {
                groupedResults[date] = [];
              }
              groupedResults[date]!.add(result);
            }

            // Convertir a lista de AnterioresPerDay y ordenar por fecha descendente
            final anterioresPerDay = groupedResults.entries
                .map((entry) => AnterioresPerDay(
                      fecha: entry.key,
                      results: entry.value,
                    ))
                .toList()
              ..sort((a, b) => b.fecha.compareTo(a.fecha));

            return Center(
              child: ListView.builder(
                controller: _scroll,
                itemCount: anterioresPerDay.length,
                itemBuilder: (context, index) {
                  final result = anterioresPerDay[index];
                  return ResultCard(
                    results: result.results,
                    lottery: lottery,
                  );
                },
              ),
            );
          },
        ),
        floatingActionButton: _isFabVisible
            ? FloatingActionButton(
                onPressed: () {
                  if (widget.lotteryId != null) {
                    lotteryBloc.setLoading();
                    lotteryBloc
                        .loadLotteryResults(int.parse(widget.lotteryId!));
                  }
                },
                child: const Icon(Icons.refresh_rounded),
              )
            : null,
      );
    });
  }
}
