import 'package:greating_card/presentation/pages/home_page.dart';
import 'package:greating_card/presentation/provider/card_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CardMaker());
}

class CardMaker extends StatelessWidget {
  const CardMaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CardNotifier(),
      builder: (context, _) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    );
  }
}
