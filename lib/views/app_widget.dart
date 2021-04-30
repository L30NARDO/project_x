import 'package:flutter/material.dart';
import 'package:project_x/controllers/app_controller.dart';
import 'package:project_x/views/home_page.dart';
import 'package:project_x/views/login_page.dart';
import 'package:project_x/views/currency_widget.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
              theme: ThemeData(
                  primaryColor: Colors.blue[900],
                  brightness: AppController.instance.isDartTheme
                      ? Brightness.dark
                      : Brightness.light),
              initialRoute: '/currency',
              routes: {
                '/': (context) => LoginPage(),
                '/home': (context) => HomePage(),
                '/currency': (context) => CurrencyPage(),
              } //Routes
              );
        } // Builder
        );
  }
}
