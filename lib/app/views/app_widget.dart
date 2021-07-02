import 'package:flutter/material.dart';
import 'package:project_x/app/controllers/app_controller.dart';
import 'package:project_x/app/controllers/user_controller.dart';
import 'package:project_x/app/views/currency_view.dart';
import 'package:project_x/app/views/register_view.dart';
import 'package:project_x/app/views/user_form.dart';
import 'package:project_x/app/views/user_list_view.dart';
import 'package:provider/provider.dart';

import 'home_view.dart';
import 'login_view.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return ChangeNotifierProvider(
            create: (ctx) => Users(),
            child: MaterialApp(
                theme: ThemeData(
                    fontFamily: "Brand Bold",
                    primaryColor: Colors.blue[900],
                    brightness: AppController.instance.isDartTheme
                        ? Brightness.dark
                        : Brightness.light),
                initialRoute: '/',
                routes: {
                  '/': (context) => LoginView(),
                  '/register': (context) => RegisterView(),
                  '/home': (context) => HomeView(),
                  '/currency': (context) => CurrencyView(),
                  '/userlist': (context) => UserListView(),
                  '/userform': (context) => UserForm(),
                } //Routes
                ),
          );
        } // Builder
        );
  }
}
