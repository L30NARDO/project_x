import 'package:flutter/material.dart';
import 'package:project_x/app/models/user_model.dart';
import 'package:project_x/app/controllers/user_controller.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user.id.isNotEmpty) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    //search method where you do not need the same function twice
    Object? verify = ModalRoute.of(context)!.settings.arguments;
    if (verify != null) {
      final User user = ModalRoute.of(context)!.settings.arguments as User;
      _loadFormData(user);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('User Form'),
          actions: [
            IconButton(
                onPressed: () {
                  if (_form.currentState!.validate()) {
                    _form.currentState!.save();
                    Provider.of<Users>(context, listen: false).put(
                      User(
                          id: _formData['id'].toString(),
                          name: _formData['name'].toString(),
                          email: _formData['email'].toString(),
                          avatarUrl: _formData['avatarUrl'].toString()),
                    );
                    Navigator.of(context).pop();
                  }
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value!.trim().length < 3) {
                      return 'Nome muito pequeno';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['name'] = value!,
                ),
                TextFormField(
                    initialValue: _formData['email'],
                    decoration: InputDecoration(labelText: 'Email'),
                    onSaved: (value) => _formData['email'] = value!),
                TextFormField(
                    initialValue: _formData['avatarUrl'],
                    decoration: InputDecoration(labelText: 'Url Avatar'),
                    onSaved: (value) => _formData['avatarUrl'] = value!)
              ],
            ),
          ),
        ));
  }
}
