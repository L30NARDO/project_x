import 'package:flutter/material.dart';
import 'package:project_x/app/controllers/currency_controller.dart';
import 'package:project_x/app/models/currency_model.dart';
import 'package:project_x/app/components/currency_box.dart';

class CurrencyView extends StatefulWidget {
  @override
  _CurrencyViewState createState() => _CurrencyViewState();
}

class _CurrencyViewState extends State<CurrencyView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  CurrencyController currencyController =
      CurrencyController(TextEditingController(), TextEditingController());
  final CurrencyModel selectedItem =
      CurrencyModel(name: '', real: 0, dollar: 0, euro: 0, bitcoin: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Currency Convert"),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 100, right: 30, bottom: 20, left: 30),
              child: Column(
                children: [
                  Icon(
                    Icons.monetization_on,
                    color: Colors.green,
                    size: 100,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CurrencyBox(
                    selectedItem: currencyController.toCurrency,
                    currencies: currencyController.currencies,
                    onChanged: (model) {
                      setState(() {
                        currencyController.toCurrency = model!;
                      });
                    },
                    controller: currencyController.toText,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CurrencyBox(
                    selectedItem: currencyController.fromCurrency,
                    currencies: currencyController.currencies,
                    onChanged: (model) {
                      setState(() {
                        currencyController.fromCurrency = model!;
                      });
                    },
                    controller: currencyController.fromText,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, onPrimary: Colors.white),
                    onPressed: () {
                      currencyController.convert();
                    },
                    child: Text(
                      'CONVETER',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
