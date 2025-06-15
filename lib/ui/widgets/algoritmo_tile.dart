import 'package:flutter/material.dart';

class AlgoritmoTile extends StatelessWidget {
  final String title;

  final String imageSrc;

  final void Function()? onTap;

  const AlgoritmoTile({
    super.key,
    required this.title,
    required this.imageSrc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        visualDensity: VisualDensity.compact,
        onTap: onTap,
        leading: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imageSrc),
            ),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_outlined),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
