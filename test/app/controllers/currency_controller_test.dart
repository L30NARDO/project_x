import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_x/app/controllers/currency_controller.dart';
import 'package:project_x/app/models/currency_model.dart';

main() {
  CurrencyModel dollar = CurrencyModel(
      name: 'Dollar', real: 5.63, dollar: 1.0, euro: 0.85, bitcoin: 0.000088);
  CurrencyModel real = CurrencyModel(
      name: 'Real', real: 1.0, dollar: 0.18, euro: 0.15, bitcoin: 0.000016);
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final currencyController = CurrencyController(toText, fromText);

  test('Calculate the value of the conversion of Real for Dollar ', () {
    toText.text = '2.0';
    currencyController.toCurrency = real;
    currencyController.fromCurrency = dollar;
    currencyController.convert();
    expect(fromText.text, '0.36');
  });

  test('Calculate the value of the conversion of Dollar for Real', () {
    toText.text = '2.0';
    currencyController.toCurrency = dollar;
    currencyController.fromCurrency = real;
    currencyController.convert();
    expect(fromText.text, '11.26');
  });
}
