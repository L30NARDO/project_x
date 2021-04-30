import 'package:flutter/material.dart';
import 'package:project_x/app/controllers/app_controller.dart';
import 'package:project_x/app/views/currency_view.dart';

import 'home_view.dart';
import 'login_view.dart';

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
                '/': (context) => LoginView(),
                '/home': (context) => HomeView(),
                '/currency': (context) => CurrencyView(),
              } //Routes
              );
        } // Builder
        );
  }
}
