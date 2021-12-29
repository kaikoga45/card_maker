import 'package:flutter/material.dart';
import 'package:greating_card/styles/text_styles.dart';

class JapanCard extends StatelessWidget {
  final String name;
  final String message;

  const JapanCard({
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
            '1.png',
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(65),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('HAPPY \nNEW 2020 \nYEAR', style: headline_1),
                  const SizedBox(height: 10),
                  Text(
                    message,
                    style: body,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Dari: $name',
                    style: caption_2,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Created by \n@learnwithamaker,',
                  style: caption_1,
                ),
                Image.asset(
                  'logo.png',
                  height: 50,
                  width: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
