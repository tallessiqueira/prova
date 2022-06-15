import 'package:flutter/material.dart';
import 'package:teste/controllers/usuarioController.dart';
import 'package:teste/routes/app_routes.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 100),
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
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
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
                      child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Senha",
                          ),
                          validator: (value) {
                            if (value == '') {
                              return 'Campo obrigatório';
                            }

                            return null;
                          },
                          onSaved: (value) => _formData['password'] = value!),
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
                              UsuarioController().realizarLogin(_formData);

                            }
                          },
                          child: Text('ENTRAR'),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.ESQUECISENHA);
                          },
                          child: Text('Esqueci minha senha'),
                        )),
                    Container(
                        child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.REGISTRO);
                      },
                      child: Text('Cadastrar-se'),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
