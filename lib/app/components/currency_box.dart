import 'package:flutter/material.dart';
import 'package:project_x/app/models/currency_model.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> currencies;
  final TextEditingController controller;
  final void Function(CurrencyModel? model)? onChanged;
  final CurrencyModel selectedItem;

  const CurrencyBox(
      {Key? key,
      required this.currencies,
      required this.controller,
      required this.onChanged,
      required this.selectedItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              value: selectedItem,
              iconEnabledColor: Colors.green,
              isExpanded: true,
              underline: Container(
                height: 1,
                color: Colors.green,
              ),
              items: currencies
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        Container(
          width: 15,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
