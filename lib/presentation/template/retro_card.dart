import 'package:flutter/material.dart';
import 'package:greating_card/styles/text_styles.dart';

class RetroCard extends StatelessWidget {
  final String name;
  final String message;

  const RetroCard({
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
            'assets/3.png',
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'HALLO',
                  style: headline_2,
                ),
                Text(
                  '2022',
                  style: headline_2,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Text(
              message,
              style: body,
              textAlign: TextAlign.center,
            ),
            Text(
              'Dari: $name',
              style: caption_2,
              textAlign: TextAlign.center,
            ),
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
