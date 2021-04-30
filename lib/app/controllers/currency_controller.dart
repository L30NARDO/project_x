import 'package:flutter/cupertino.dart';
import 'package:project_x/app/models/currency_model.dart';

class CurrencyController {
  List<CurrencyModel> currencies = CurrencyModel.getCurrencies();
  final TextEditingController toText;
  final TextEditingController fromText;

  CurrencyModel toCurrency =
      CurrencyModel(name: '', real: 0, dollar: 0, euro: 0, bitcoin: 0);
  CurrencyModel fromCurrency =
      CurrencyModel(name: '', real: 0, dollar: 0, euro: 0, bitcoin: 0);

  CurrencyController(this.toText, this.fromText) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void set setToCurrency(CurrencyModel toCurrency) {
    this.toCurrency = toCurrency;
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1;
    double returnValue = 0;

    if (fromCurrency.name == 'Real') {
      returnValue = value * toCurrency.real;
    } else if (fromCurrency.name == 'Dollar') {
      returnValue = value * toCurrency.dollar;
    } else if (fromCurrency.name == 'Euro') {
      returnValue = value * toCurrency.euro;
    } else if (fromCurrency.name == 'Bitcoin') {
      returnValue = value * toCurrency.bitcoin;
    }
    fromText.text = returnValue.toStringAsFixed(2);
  }
}
