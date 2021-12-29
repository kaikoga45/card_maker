import 'dart:typed_data';
import 'package:greating_card/common/constants.dart';
import 'package:greating_card/presentation/provider/card_notifier.dart';
import 'package:greating_card/presentation/template/japan_card.dart';
import 'package:greating_card/presentation/template/looping_card.dart';
import 'package:greating_card/presentation/template/retro_card.dart';
import 'package:greating_card/presentation/widgets/custom_button.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:greating_card/styles/text_styles.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

import 'edit_card_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Uint8List? imageFile;
  final screenshotController = ScreenshotController();
  ValueNotifier<int>? index;

  @override
  void initState() {
    super.initState();
    index = ValueNotifier<int>(0);
  }

  @override
  void dispose() {
    super.dispose();
    index?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CardNotifier>(builder: (context, provider, _) {
      if (provider.state == CardState.loading) {
        context.loaderOverlay.show();
      } else if (provider.state == CardState.download) {
        context.loaderOverlay.hide();
      }
      final cardList = [
        JapanCard(name: provider.name, message: provider.message),
        LoopCard(name: provider.name, message: provider.message),
        RetroCard(name: provider.name, message: provider.message),
      ];
      return LoaderOverlay(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: false,
            title: Text(
              'Card Maker',
              style: title,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CarouselSlider(
                    items: cardList,
                    options: CarouselOptions(
                      height: 579,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) => setIndex(index),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton.edit(
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditCardPage(),
                            ),
                          );
                        },
                      ),
                      CustomButton.download(
                        () {
                          Provider.of<CardNotifier>(context, listen: false)
                              .saveImage(cardList[index?.value ?? 0]);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'V1 Created by @learnwithamaker',
                    textAlign: TextAlign.center,
                    style: overline,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void setIndex(int index) {
    this.index?.value = index;
  }
}
