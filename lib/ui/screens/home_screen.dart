import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tu_bolitero/ui/logic/ad/ad_cubit.dart';
import 'package:tu_bolitero/ui/widgets/ad_modal.dart';
import 'package:tu_bolitero/ui/widgets/home_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu Bolitero'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bolitero2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(),
            ),
            ListTile(
              leading: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset('assets/whatsapp.png'),
              ),
              title: const Text('Canal de Whatsapp'),
              onTap: () => launchUrl(Uri.parse(
                  'https://whatsapp.com/channel/0029VaCVnwn9mrGZA0iKjd0t')),
            ),
            ListTile(
              leading: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset('assets/telegram.png'),
              ),
              title: const Text('Canal de Telegram'),
              onTap: () => launchUrl(Uri.parse('https://t.me/Tu_boliteros')),
            ),
            ListTile(
              leading: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset('assets/contact.png'),
              ),
              title: const Text('Contacto'),
              onTap: () => launchUrl(Uri.parse('https://t.me/Fenix_real1')),
            ),
          ],
        ),
      ),
      body: BlocListener<AdCubit, AdState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loaded: (ad) {
              showDialog(
                context: context,
                builder: (context) => AdModal(screenSize: screenSize, ad: ad),
              );
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeTile(
              title: 'Resultados de loterias',
              imageSrc: 'assets/Ellipse 1.png',
              onTap: () => context.go('/results'),
            ),
            const Divider(),
            HomeTile(
              title: 'Atrasados',
              imageSrc: 'assets/atrasados.png',
              onTap: () => context.go('/atrasados'),
            ),
            const Divider(),
            HomeTile(
              title: 'Número de la suerte',
              imageSrc: 'assets/suerte.png',
              onTap: () => context.go('/numero_suerte'),
            ),
            const Divider(),
            HomeTile(
              title: 'Charada',
              imageSrc: 'assets/charada.png',
              onTap: () => context.go('/charada'),
            ),
          ],
        ),
      ),
    );
  }
}
