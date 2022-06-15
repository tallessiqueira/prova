import 'package:flutter/material.dart';
import 'package:teste/models/user.dart';
import 'package:teste/routes/app_routes.dart';
import 'package:teste/views/esqueciSenha.dart';
import 'package:teste/views/login.dart';
import 'package:teste/views/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      routes: {
        AppRoutes.LOGIN: (_) => Login(),
        AppRoutes.REGISTRO: (_) => Registro(),
        AppRoutes.ESQUECISENHA: (_) => EsqueciSenha(),
      },
    );
  }
}
