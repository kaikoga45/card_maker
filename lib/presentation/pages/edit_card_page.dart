import 'package:flutter/material.dart';
import 'package:greating_card/presentation/provider/card_notifier.dart';
import 'package:greating_card/presentation/widgets/custom_button.dart';
import 'package:greating_card/styles/color.dart';
import 'package:greating_card/styles/text_styles.dart';
import 'package:provider/provider.dart';

class EditCardPage extends StatefulWidget {
  const EditCardPage({Key? key}) : super(key: key);

  @override
  State<EditCardPage> createState() => _EditCardPageState();
}

class _EditCardPageState extends State<EditCardPage> {
  final nameController = TextEditingController();
  final messageController = TextEditingController();

  late final CardNotifier cardProvider;

  @override
  void initState() {
    super.initState();
    cardProvider = Provider.of<CardNotifier>(context, listen: false);
    nameController.text = cardProvider.name;
    messageController.text = cardProvider.message;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: fontColor,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Edit Card',
          style: title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              maxLength: 30,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: messageController,
              maxLength: 180,
              decoration: const InputDecoration(
                labelText: 'Message',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton.save(
              () {
                cardProvider.updateCard(
                  nameController.text,
                  messageController.text,
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
