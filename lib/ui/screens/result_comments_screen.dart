import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tu_bolitero/domain/models/lottery.dart';
import 'package:tu_bolitero/ui/logic/lottery/lottery_cubit.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';
import 'package:tu_bolitero/ui/widgets/result_comment_tile.dart';

class ResultCommentsScreen extends StatefulWidget {
  final String lotteryId;
  final String resultId;
  const ResultCommentsScreen(
      {super.key, required this.lotteryId, required this.resultId});

  @override
  State<ResultCommentsScreen> createState() => _ResultCommentsScreenState();
}

class _ResultCommentsScreenState extends State<ResultCommentsScreen> {
  final TextEditingController _commentController = TextEditingController();
  bool _isCommenting = false;

  @override
  Widget build(BuildContext context) {
    final lotteryBloc = BlocProvider.of<LotteryCubit>(context);
    return Scaffold(
      appBar: const BoliteroAppBar(),
      bottomNavigationBar: const BottomBar(index: 0),
      body: BlocBuilder<LotteryCubit, LotteryState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(
              child: Text('Pantalla de Comentarios'),
            ),
            loading: (lotteries, comments) => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (lotteries, comments) {
              final Lottery? lottery = lotteries
                  .where((lottery) => lottery.id.toString() == widget.lotteryId)
                  .toList()
                  .firstOrNull;

              if (lottery == null) {
                return const Center(
                  child: Text('Lotería no encontrada'),
                );
              }

              final LotteryResult? result = lottery.anteriores
                  .where((result) => result.id.toString() == widget.resultId)
                  .toList()
                  .firstOrNull;

              if (result == null) {
                return const Center(
                  child: Text('Resultado no encontrado'),
                );
              }

              final List<ResultComment>? disaplayedComments =
                  comments[widget.resultId.toString()];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Comentarios",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400)),
                            Text(
                              DateFormat.MMMMEEEEd().format(result.fecha),
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant),
                            ),
                          ],
                        ),
                        FilledButton(
                            onPressed: () {
                              setState(() {
                                _isCommenting = !_isCommenting;
                              });
                            },
                            child: Text(_isCommenting
                                ? 'Cancelar'
                                : 'Añadir comentario'))
                      ],
                    ),
                    if (_isCommenting)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 8,
                          minLines: 1,
                          controller: _commentController,
                          onChanged: (_) => setState(() {}),
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide.none,
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.send_rounded,
                                  color: _commentController.text.isNotEmpty
                                      ? Theme.of(context).colorScheme.primary
                                      : null),
                              onPressed: () {
                                lotteryBloc.addResultComment(
                                  int.parse(widget.resultId),
                                  _commentController.text,
                                  int.parse(widget.lotteryId),
                                );
                                _commentController.clear();
                              },
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListView.builder(
                          itemCount: disaplayedComments?.length ?? 0,
                          itemBuilder: (context, index) {
                            final comment = disaplayedComments![index];
                            return ResultCommentTile(
                              comment: comment,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          lotteryBloc.loadResultComments(int.parse(widget.resultId));
          setState(() {
            _isCommenting = false;
          });
        },
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }
}
