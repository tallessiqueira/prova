import 'package:flutter/material.dart';
import 'package:teste/routes/app_routes.dart';

import '../controllers/usuarioController.dart';

class EsqueciSenha extends StatelessWidget {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 100),
                          alignment: Alignment.center,
                          child: Text(
                            "Informe um e-mail cadastrado em sua conta"
                            "para receber uma nova senha temporária.",
                            textAlign: TextAlign.center,
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 2),
                          alignment: Alignment.center,
                          child: Text(
                            "Não esqueça de chegar também a caixa de spam de seu e-mail",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10, color: Colors.blue),
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 100),
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
                          margin: EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(40),
                            ),
                            onPressed: () {
                              final isValid = _form.currentState?.validate();

                              if (isValid!) {
                                _form.currentState?.save();
                                UsuarioController().esqueciSenhaFuncao(_formData);

                              }
                            },
                            child: Text('RECUPERAR'),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    ));
  }
}
