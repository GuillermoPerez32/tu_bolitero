import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tu_bolitero/core/constants.dart';

class LotteryTile extends StatelessWidget {
  final String title;
  final String imageSrc;
  final void Function()? onTap;

  const LotteryTile({
    super.key,
    required this.title,
    required this.imageSrc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const tileHeight = 100.0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Center(
        child: ListTile(
          visualDensity: VisualDensity.compact,
          onTap: onTap,
          tileColor: Colors.white,
          leading: Hero(
            tag: imageSrc,
            child: Container(
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
