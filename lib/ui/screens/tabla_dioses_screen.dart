import 'package:flutter/material.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';
import 'package:tu_bolitero/ui/widgets/number_table.dart';

// ─────────── Tabla 1 (superior) ───────────
final List<List<String>> tabla1 = [
  ['34', '65', '86', '14', '66', '55', '59', '01', '20', '39'],
  ['82', '36', '60', '90', '07', '25', '58', '27', '97', '45'],
  ['23', '61', '19', '18', '50', '17', '92', '16', '09', '40'],
  ['91', '11', '35', '89', '81', '84', '48', '44', '30', '54'],
  ['02', '33', '51', '85', '52', '87', '06', '21', '80', '67'],
  ['74', '83', '71', '88', '56', '26', '95', '98', '72', '76'],
  ['49', '94', '32', '75', '04', '38', '63', '42', '53', '78'],
  ['24', '99', '37', '12', '22', '57', '69', '41', '28', '79'],
  ['73', '93', '10', '46', '62', '31', '00', '03', '47', '68'],
  ['96', '70', '77', '13', '08', '64', '43', '15', '29', '05'],
];

// ─────────── Tabla 2 (inferior) ───────────
final List<List<String>> tabla2 = [
  ['63', '82', '67', '10', '72', '98', '31', '35', '95', '71'],
  ['47', '12', '91', '52', '40', '23', '53', '45', '16', '68'],
  ['30', '99', '94', '80', '39', '59', '46', '56', '14', '00'],
  ['11', '07', '34', '90', '69', '41', '58', '38', '92', '64'],
  ['20', '04', '83', '86', '18', '81', '42', '93', '17', '75'],
  ['84', '79', '85', '06', '62', '88', '76', '73', '60', '51'],
  ['70', '96', '24', '24', '89', '97', '03', '02', '25', '74'],
  ['50', '32', '65', '43', '87', '22', '29', '77', '13', '15'],
  ['01', '48', '44', '09', '78', '37', '27', '54', '57', '28'],
  ['33', '26', '66', '08', '49', '19', '36', '55', '61', '05'],
];

class TablaDiosesScreen extends StatelessWidget {
  const TablaDiosesScreen({
    super.key,
    required this.lotteryId,
  });

  final String lotteryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tabla de los Dioses',
        ),
      ),
      bottomNavigationBar: const BottomBar(index: 1),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: FilledButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const HelpDialog(),
                    );
                  },
                  child: const Text(
                    'Cómo usar la tabla de los dioses?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Column(
                        children: [
                          NumberTable(data: tabla1),
                          const SizedBox(height: 32),
                          NumberTable(data: tabla2),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HelpDialog extends StatelessWidget {
  const HelpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text(
        'Como usar la tabla de los dioses?',
      ),
      content: Text(
        'Debes sacar los número por el fijo que salio, todos los que rodean ese número',
      ),
    );
  }
}
