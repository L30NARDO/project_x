import 'package:flutter/material.dart';
import 'package:project_x/app/models/user_model.dart';
import 'package:project_x/app/controllers/user_controller.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.trim().isEmpty
        ? CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
          );

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/userform',
                    arguments: user,
                  );
                },
                color: Colors.yellow,
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text('Delete User ${user.name}'),
                            content: Text('You are sure?'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Not'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Provider.of<Users>(context, listen: false)
                                      .remove(user);
                                  Navigator.of(context).pop();
                                },
                                child: Text('Yes'),
                              )
                            ],
                          ));
                },
                color: Colors.red,
                icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
