import 'package:flutter/material.dart';
import 'package:project_x/app/controllers/currency_controller.dart';
import 'package:project_x/app/utils/currency_box.dart';

// ignore: must_be_immutable
class CurrencyView extends StatelessWidget {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  CurrencyController currencyController =
      new CurrencyController(TextEditingController(), TextEditingController());

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
                    color: Colors.blue[900],
                    size: 100,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CurrencyBox(),
                  SizedBox(
                    height: 10,
                  ),
                  CurrencyBox(),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[900], onPrimary: Colors.white),
                    onPressed: () {},
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
