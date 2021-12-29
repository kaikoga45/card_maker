import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greating_card/styles/text_styles.dart';

class LoopCard extends StatelessWidget {
  final String name;
  final String message;

  const LoopCard({
    Key? key,
    required this.name,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minWidth: 270, minHeight: 518, maxWidth: 325, maxHeight: 579),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/2.png',
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/fireworks.svg',
              height: 188.46,
            ),
            Text(
              'Selamat Tahun Baru',
              style: headline_1,
            ),
            Text(
              message,
              style: body,
              textAlign: TextAlign.center,
            ),
            Text('Dari: $name', style: caption_2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Created by \n@learnwithamaker,',
                  style: caption_1,
                ),
                Image.asset(
                  'assets/logo.png',
                  height: 50,
                  width: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
