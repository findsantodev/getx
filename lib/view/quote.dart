import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/quote/quote_controller.dart';

class VQuote extends StatefulWidget {
  const VQuote({
    Key? key,
  }) : super(key: key);

  @override
  State<VQuote> createState() => _VQuoteState();
}

class _VQuoteState extends State<VQuote> {
  final quoteController = Get.find<QuoteController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/kanye_west_image.png",
            height: 300,
            width: 200,
          ),
          Obx(
            () => Text(
              "${quoteController.currentQuote}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => quoteController.getQuote(),
            child: const Text("GET QUOTE"),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => quoteController.addQuoute(
                quote: quoteController.currentQuote.value),
            child: const Text("ADD FAVORITE"),
          ),
          Obx(() => ListView.builder(
              shrinkWrap: true,
              itemCount: quoteController.quotes.length,
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
                        quoteController.quotes[index],
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
