import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx/controller/quote/quote_repository.dart';
import 'package:getx/model/quote/quote.dart';

class QuoteController extends GetxController {
  final QuoteRepository _repository = QuoteRepository();

  var currentQuote = "".obs;
  var quotes = [].obs;
  var personalQuotes = [].obs;

  addQuoute({required String quote}) {
    if (quotes.contains(quote)) {
      duplicateQuote();
    } else {
      quotes.add(quote);
    }
  }

  addPersonalQuote({required String quote}) {
    if (personalQuotes.contains(quote)) {
      duplicateQuote();
    } else {
      personalQuotes.add(quote);
    }
  }

  Future<void> getQuote() async {
    try {
      final Response _response = await _repository.getQuote(endpoint: "/");
      Quote _quote = Quote.fromJson(_response.data);
      currentQuote.value = _quote.quote;
    } catch (e) {
      log(e.toString());
    }
  }

  duplicateQuote() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        padding: const EdgeInsets.all(40),
        width: double.infinity,
        child: const Text(
          "NO DUPLICATE QUOTE",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
