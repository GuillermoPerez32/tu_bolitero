import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  final String title;

  final String imageSrc;

  final void Function()? onTap;

  const HomeTile({
    super.key,
    required this.title,
    required this.imageSrc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
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
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
