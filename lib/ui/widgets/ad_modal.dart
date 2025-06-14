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
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: screenSize.height * .75,
          width: screenSize.width * .8,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        height: screenSize.height * .2,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: ad.imagen.replaceAll('http', 'https'),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: SingleChildScrollView(
                            child: Text(
                              ad.mensaje,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.1,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      FilledButton(
                        onPressed: () => launchUrl(Uri.parse(ad.link)),
                        child: const Text('Ir al enlace'),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.white,
                      child: Icon(
                        Icons.notification_important_outlined,
                        size: 40,
                        color: Theme.of(context).colorScheme.primary,
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
