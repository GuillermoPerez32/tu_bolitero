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
    const tileHeight = 90.0;
    const imageSize = 40;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          elevation: 0,
          child: SizedBox(
            height: tileHeight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Hero(
                    tag: imageSrc,
                    child: Container(
                      width: imageSize.toDouble(),
                      height: imageSize.toDouble(),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            host + imageSrc,
                            maxWidth: imageSize,
                            maxHeight: imageSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.chevron_right,
                    color: Color.fromARGB(255, 60, 60, 67),
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
