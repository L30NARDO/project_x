import 'package:project_x/app/models/login_model.dart';
import 'package:project_x/app/models/user_model.dart';

const DUMMY_LOGIN = {
  '1': const Login(
      user: User(
          id: '1',
          name: "Leonardo Souza",
          email: 'Teste@teste.com',
          avatarUrl:
              'https://cdn.pixabay.com/photo/2014/11/29/19/33/bald-eagle-550804_960_720.jpg'),
      password: '123'),
  '2': const Login(
      user: User(
          id: '2',
          name: "Lianna Souza",
          email: 'lianna@teste.com',
          avatarUrl:
              'https://cdn.pixabay.com/photo/2017/04/05/10/45/girl-2204622_960_720.jpg'),
      password: '123'),
  '3': const Login(
      user: User(
          id: '3',
          name: "Maria Souza",
          email: 'maria@teste.com',
          avatarUrl:
              'https://cdn.pixabay.com/photo/2015/09/02/12/58/woman-918788_960_720.jpg'),
      password: '123')
};
