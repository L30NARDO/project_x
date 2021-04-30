import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String email = '';
  String password = '';
  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 250,
                height: 150,
                child: Image.asset('assets/images/logo.png'),
              ),
              Container(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (text) {
                          email = text;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        onChanged: (text) {
                          password = text;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[900],
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          if (email == 'teste@teste.com' &&
                              password == 'teste') {
                            Navigator.of(context).pushReplacementNamed('/home'
                                //pushReplacement(
                                //    MaterialPageRoute(builder: (context) => HomePage()),
                                );
                          } else {
                            if (email != 'teste@teste.com') {
                              showAlertDialog1(context,
                                  'Campo EMAIL vazio ou incorreto, confira suas credenciais');
                            } else {
                              showAlertDialog1(context,
                                  'Campo SENHA vazio ou incorreto, confira suas crendenciais');
                            }
                          }
                        },
                        child: Container(
                            width: double.infinity,
                            child: Text('Entrar', textAlign: TextAlign.center)),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          )),
    );
  }

  showAlertDialog1(BuildContext context, String erro) {
    // configura o button
    Widget okButton = TextButton(
      style: TextButton.styleFrom(
        primary: Colors.blue[900],
      ),
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text('ERRO EM CREDENCIAIS!'),
      content: Text(erro),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.1),
        ),
        _body(),
      ],
    ));
  }
}
