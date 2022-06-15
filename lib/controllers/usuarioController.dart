import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class UsuarioController {
  realizarLogin(form) async {
    var url = Uri.parse("https://api.remote.net.br/user/app/login");
    var response = await http.post(url,
        body: {'email': form['email'], 'password': form['password']});

    var resposta = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    if (resposta["\$error"]['code'] == 5) {
      Fluttertoast.showToast(
          msg: resposta["\$error"]['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
      return;
    } else {
      Fluttertoast.showToast(
          msg: resposta["\$error"]['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
      return;
    }
  }

  esqueciSenhaFuncao(form) async {
    var url = Uri.parse("https://api.remote.net.br/user/reset");
    var response = await http.post(url,
        body: {'email': form['email']});

    var resposta = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    if (resposta["\$success"]['code'] == 39) {
      Fluttertoast.showToast(
          msg: resposta["\$success"]['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16);
      return;
    } else {
      Fluttertoast.showToast(
          msg: resposta["\$success"]['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
      return;
    }
  }

  realizarCadastro(form) async {
    if(form['password'] != form['confirmPassword']){
      Fluttertoast.showToast(
          msg: "Senha de confirmação diferente",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
      return;
    }

    var url = Uri.parse("https://api.remote.net.br/user/app");
    var response = await http.post(url,
        body: {'email': form['email'], 'password': form['password'], 'name': form['name']
          , 'phone': form['phone'], 'registry': ''
        });

    var resposta = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    if (resposta["\$error"] != null) {
      Fluttertoast.showToast(
          msg: resposta["\$error"]['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
      return;
    } else {
      Fluttertoast.showToast(
          msg: "Usuário cadastrado com sucesso",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16);
      return;
    }
  }
}
