import 'package:flutter/material.dart';
import 'package:project_x/app/controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String email = '';
  String password = '';
  bool obscure = true;
  late LoginController loginController = new LoginController();

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
                      TextFormField(
                        onChanged: (text) {
                          email = text;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          icon: Icon(
                            Icons.email,
                            color: Colors.blue[900],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        onChanged: (text) {
                          password = text;
                        },
                        obscureText: obscure,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          icon: Icon(
                            Icons.lock,
                            color: Colors.blue[900],
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              obscure ? Icons.visibility : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                          ),
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
                          print(loginController.verifyLogin(email, password));
                          // if (email == 'teste@teste.com' &&
                          //     password == 'teste') {
                          if (loginController.verifyLogin(email, password)) {
                            Navigator.of(context).pushReplacementNamed('/home'
                                //pushReplacement(
                                //    MaterialPageRoute(builder: (context) => HomePage()),
                                );
                          } else {
                            if (email == '') {
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
