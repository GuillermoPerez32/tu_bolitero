import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/data/datasources/lottery_datasource.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados de loterias'),
      ),
      body: FutureBuilder(
        future: lotteryDatasource.getLotteries(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }

          final lotteries = snapshot.data!;

          return ListView(
            children: lotteries
                .map((lottery) => ResultsTile(
                      title: lottery.nombre,
                      imageSrc: lottery.logo,
                      onTap: () => context.go('/results/${lottery.id}'),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}

class ResultsTile extends StatelessWidget {
  final String title;
  final String imageSrc;
  final void Function()? onTap;

  const ResultsTile({
    super.key,
    required this.title,
    required this.imageSrc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const tileHeight = 150.0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: tileHeight,
      child: Center(
        child: ListTile(
          visualDensity: VisualDensity.compact,
          onTap: onTap,
          tileColor: Colors.white,
          leading: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  host + imageSrc,
                  maxWidth: 70,
                  maxHeight: 70,
                ),
              ),
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
          title: SizedBox(
            height: tileHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
