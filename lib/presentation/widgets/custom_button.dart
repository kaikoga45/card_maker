import 'package:flutter/material.dart';
import 'package:greating_card/styles/color.dart';
import 'package:greating_card/styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Color color;

  const CustomButton._({
    required this.title,
    required this.onPressed,
    required this.color,
  });

  factory CustomButton.save(Function()? onPressed) {
    return CustomButton._(
      title: 'Save',
      onPressed: onPressed,
      color: saveBtnColor,
    );
  }

  factory CustomButton.edit(Function()? onPressed) {
    return CustomButton._(
      title: 'Edit',
      onPressed: onPressed,
      color: editBtnColor,
    );
  }

  factory CustomButton.download(Function()? onPressed) {
    return CustomButton._(
      title: 'Download',
      onPressed: onPressed,
      color: downloadBtnColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        primary: color,
        fixedSize: const Size(
          135,
          50,
        ),
      ),
      child: Text(
        title,
        style: button,
      ),
      onPressed: onPressed,
    );
  }
}
