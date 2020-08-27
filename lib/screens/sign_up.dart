import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sinaliza_compras/model/user_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _nameController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _addressController = TextEditingController();
  final _numberHomeController = TextEditingController();
  final _neighborController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Criar Conta"),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );

            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.only(left: 16, right: 16, top: 64),
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: "Primeiro Nome",
                      border: OutlineInputBorder(
                        borderRadius:
                        const BorderRadius.all(const Radius.circular(28.0)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "O campo (primeiro nome) está vazio!";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _fullnameController,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: "Nome Completo",
                      border: OutlineInputBorder(
                        borderRadius:
                        const BorderRadius.all(const Radius.circular(28.0)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "O campo (nome completo) está vazio!";
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height *.08,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: TextFormField(
                            controller: _addressController,
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelText: "Endereço",
                              border: OutlineInputBorder(
                                borderRadius:
                                const BorderRadius.all(const Radius.circular(28.0)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validator: (text) {
                              if (text.isEmpty) return "O campo (endereço) está vazio ";
                            },
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            controller: _numberHomeController,
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelText: "Número",
                              border: OutlineInputBorder(
                                borderRadius:
                                const BorderRadius.all(const Radius.circular(28.0)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.numberWithOptions(),
                            validator: (text) {
                              if (text.isEmpty) return "O campo (número) está vazio ";
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    controller: _neighborController,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: "Bairro",
                      border: OutlineInputBorder(
                        borderRadius:
                        const BorderRadius.all(const Radius.circular(28.0)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty) return "O campo (bairro) está vazio ";
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height *.08,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: TextFormField(
                            controller: _cityController,
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelText: "Cidade",
                              border: OutlineInputBorder(
                                borderRadius:
                                const BorderRadius.all(const Radius.circular(28.0)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validator: (text) {
                              if (text.isEmpty) return "O campo (cidade) está vazio ";
                            },
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            controller: _stateController,
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelText: "Estado",
                              border: OutlineInputBorder(
                                borderRadius:
                                const BorderRadius.all(const Radius.circular(28.0)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validator: (text) {
                              if (text.isEmpty) return "O campo (Estado) está vazio ";
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: "E-mail",
                      border: OutlineInputBorder(
                        borderRadius:
                        const BorderRadius.all(const Radius.circular(28.0)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty || !text.contains("@"))
                        return "E-mail inválido!";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _passController,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: "Senha",
                      border: OutlineInputBorder(
                        borderRadius:
                        const BorderRadius.all(const Radius.circular(28.0)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    obscureText: true,
                    validator: (text) {
                      if (text.isEmpty || text.length < 6)
                        return "Sua senha precisa conter seis caracteres ou mais";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text(
                        "Criar Conta",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Map<String, dynamic> userData = {
                            "name" : _nameController.text,
                            "fullName": _fullnameController.text,
                            "email": _emailController.text,
                            "address": _addressController.text,
                            "numberHome" : _numberHomeController.text,
                            "neighborhood" : _neighborController.text,
                            "city" : _cityController.text,
                            "state" : _stateController.text,
                          };

                          model.signUp(
                              userData: userData,
                              pass: _passController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail);
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário criado com sucesso!"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao criar usuário!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
