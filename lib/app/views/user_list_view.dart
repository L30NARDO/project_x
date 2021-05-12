import 'package:flutter/material.dart';
import 'package:project_x/app/components/user_tile.dart';
import 'package:project_x/app/controllers/user_controller.dart';
import 'package:provider/provider.dart';

class UserListView extends StatefulWidget {
  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/userform');
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
