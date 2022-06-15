import 'package:flutter/material.dart';

import '../controllers/usuarioController.dart';
import '../routes/app_routes.dart';

class Registro extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 60),
              alignment: Alignment.topLeft,
              child: Material(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: Container(
                          child: Image.network(
                              "https://cdn-icons-png.flaticon.com/512/2991/2991148.png"),
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: _form,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Nome",
                            ),
                            validator: (value) {
                              if (value == '') {
                                return 'Campo obrigatório';
                              }

                              return null;
                            },
                            onSaved: (value) => _formData['name'] = value!,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "E-mail",
                            ),
                            validator: (value) {
                              if (value == '') {
                                return 'Campo obrigatório';
                              }

                              return null;
                            },
                            onSaved: (value) => _formData['email'] = value!,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Telefone",
                            ),
                            validator: (value) {
                              if (value == '') {
                                return 'Campo obrigatório';
                              }

                              return null;
                            },
                            onSaved: (value) => _formData['phone'] = value!,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Senha",
                            ),
                            validator: (value) {
                              if (value == '') {
                                return 'Campo obrigatório';
                              }

                              return null;
                            },
                            onSaved: (value) => _formData['password'] = value!,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Confirme sua senha",
                            ),
                            validator: (value) {
                              if (value == '') {
                                return 'Campo obrigatório';
                              }

                              return null;
                            },
                            onSaved: (value) => _formData['confirmPassword'] = value!,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          child: Text(
                            "Ao cadastrar o usuário estará concordando com os termos de uso do aplicativo no site oficial",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 15),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(40),
                              ),
                              onPressed: () {
                                final isValid = _form.currentState?.validate();

                                if (isValid!) {
                                  _form.currentState?.save();
                                  UsuarioController().realizarCadastro(_formData);

                                }
                              },
                              child: Text('CADASTRAR-SE'),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
