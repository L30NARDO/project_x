import 'package:flutter/material.dart';

class CurrencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Currency Convert"),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 100, right: 20, bottom: 20, left: 20),
            child: Column(
              children: [
                Icon(
                  Icons.monetization_on,
                  color: Colors.blue[900],
                  size: 100,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButton(items: []),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(),
                        ),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  color: Colors.blue[900],
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Text(
                    'CONVETER',
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
