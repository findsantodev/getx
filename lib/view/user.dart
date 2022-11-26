import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/quote/quote_controller.dart';

class VUser extends StatefulWidget {
  const VUser({Key? key}) : super(key: key);

  @override
  State<VUser> createState() => _VUserState();
}

class _VUserState extends State<VUser> {
  final quoteController = Get.find<QuoteController>();
  TextEditingController quotePersonalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              controller: quotePersonalController,
              decoration: const InputDecoration(
                label: Text("add your favorite"),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => (quotePersonalController.text != "")
                ? quoteController.addPersonalQuote(
                    quote: quotePersonalController.text)
                : null,
            child: const Text(
              "ADD QUOTE",
            ),
          ),
          Obx(() => ListView.builder(
              shrinkWrap: true,
              itemCount: quoteController.personalQuotes.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        quoteController.personalQuotes[index],
                      ),
                    ),
                  ],
                );
              }))
        ],
      ),
    );
  }
}
