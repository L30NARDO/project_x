import 'package:flutter/material.dart';
import 'package:project_x/app/controllers/app_controller.dart';
import 'package:http/http.dart' as http;
import 'package:project_x/app/controllers/login_controller.dart';
import 'package:project_x/app/models/login_model.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() {
    return HomeViewState();
  }
}

class HomeViewState extends State<HomeView> {
  int counter = 0;
  late LoginController loginController = new LoginController();
  late Login login;
  @override
  Widget build(BuildContext context) {
    Object? email = ModalRoute.of(context)!.settings.arguments;
    if (email != null) {
      login = loginController.searchLoginByEmail(email.toString());
    }

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture:
                  ClipOval(child: Image.network(login.user.avatarUrl)),
              accountName: Text(login.user.name),
              accountEmail: Text(login.user.email),
            ),
            // ListTile(
            //   leading: Icon(Icons.home),
            //   title: Text('Home'),
            //   subtitle: Text('Tela de inicio'),
            //   onTap: () {
            //     Navigator.of(context).pushReplacementNamed('/home');
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('Currency'),
              subtitle: Text('Converter moeda'),
              onTap: () {
                Navigator.of(context).pushNamed('/currency');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('User'),
              subtitle: Text('Menu de usuários'),
              onTap: () {
                Navigator.of(context).pushNamed('/userlist');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              subtitle: Text('Finalizar sessão'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          CustomSwitcher(),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Count: $counter"),
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
              )
            ],
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}

class CustomSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDartTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}

fatch() {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');

  http.get(url);
}
