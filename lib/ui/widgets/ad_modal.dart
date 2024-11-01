import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tu_bolitero/domain/models/ad.dart';
import 'package:url_launcher/url_launcher.dart';

class AdModal extends StatelessWidget {
  const AdModal({
    super.key,
    required this.screenSize,
    required this.ad,
  });

  final Size screenSize;
  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: screenSize.height * .75,
          width: screenSize.width * .8,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: ad.imagen.replaceAll('http', 'https'),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Center(
                          child: Text(
                            ad.mensaje,
                            maxLines: null,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      FilledButton(
                        onPressed: () => launchUrl(Uri.parse(ad.link)),
                        child: const Text('Ir al enlace'),
                      )
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.white,
                      child: const Icon(
                        Icons.notification_important_outlined,
                        size: 40,
                        color: Colors.green,
                      ),
                    ),
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
