import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:greating_card/common/constants.dart';
import 'package:screenshot/screenshot.dart';
import 'package:universal_html/html.dart' as html;

class CardNotifier extends ChangeNotifier {
  String _name = 'Learn With Amaker';
  String get name => _name;

  String _message =
      'Doa terbaik untuk kita semua, semoga sehat selalu dan bahagia!';
  String get message => _message;

  CardState _state = CardState.standby;
  CardState get state => _state;

  void updateCard(String name, String message) {
    _name = name;
    _message = message;
    notifyListeners();
  }

  Future<void> saveImage(Widget card) async {
    _state = CardState.loading;
    notifyListeners();

    try {
      final image = await _captureWidget(card);
      _state = CardState.download;
      notifyListeners();
      _downloadImage(image);
      _state = CardState.standby;
      notifyListeners();
    } catch (e) {
      _state = CardState.error;
      notifyListeners();
    }
  }

  Future<Uint8List> _captureWidget(Widget card) async {
    final result = await ScreenshotController().captureFromWidget(card);
    return result;
  }

  void _downloadImage(Uint8List image) {
    final name = _generateRandomNumber();

    final temp = image.toList();
    final base64data = base64Encode(temp);
    final anchor =
        html.AnchorElement(href: 'data:image/jpeg;base64,$base64data')
          ..target = 'blank';
    anchor.download = '$name.jpg';
    html.document.body!.append(anchor);
    anchor.click();
    anchor.remove();
  }

  String _generateRandomNumber() {
    return Random().nextInt(1000000).toString();
  }
}
