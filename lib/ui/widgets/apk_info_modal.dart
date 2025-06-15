import 'package:flutter/material.dart';
import 'package:tu_bolitero/domain/models/apk_info.dart';
import 'package:url_launcher/url_launcher.dart';

class ApkInfoModal extends StatelessWidget {
  const ApkInfoModal({
    super.key,
    required this.screenSize,
    required this.apkInfo,
  });

  final Size screenSize;
  final ApkInfo apkInfo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: screenSize.width * .8,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Nueva Versión!",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.primaries.first),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Hay una nueva versión disponible de la apk. Por favor vaya a nuestro sitio oficial para descargar la nueva version",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FilledButton(
                        onPressed: () =>
                            launchUrl(Uri.parse('https://tuboliteros.com')),
                        child: const Text('Obtener nueva versión'),
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
                      child: Icon(
                        Icons.notification_important_outlined,
                        size: 40,
                        color: Colors.primaries.first,
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
