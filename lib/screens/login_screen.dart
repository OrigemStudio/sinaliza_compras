import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sinaliza_compras/model/user_model.dart';
import 'package:sinaliza_compras/screens/sign_up.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Entrar"),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
              child: Text(
                "CRIAR CONTA",
                style: TextStyle(fontSize: 15.0),
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
            )
          ],
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
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.purple,
                            Colors.purple[500],
                            Colors.purple[400],
                            Colors.purple[300],
                            Colors.purple[200],
                            Colors.purple[100],
                            Colors.purple[50],
                            Colors.white
                          ])
                    ),
                    height: MediaQuery.of(context).size.height /2.5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 64,
                    ),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            hintText: "E-mail",
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
                             if (text.isEmpty || ! text.contains("@"))
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
                            hintText: "Senha",
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
                              return "Senha inválida!";
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            onPressed: () {
                              if (_emailController.text.isEmpty)
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content:
                                  Text("Insira seu e-mail para recuperação!"),
                                  backgroundColor: Colors.redAccent,
                                  duration: Duration(seconds: 2),
                                ));
                              else {
                                model.recoverPass(_emailController.text);
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text("Confira seu e-mail!"),
                                  backgroundColor: Theme.of(context).primaryColor,
                                  duration: Duration(seconds: 2),
                                ));
                              }
                            },
                            child: Text(
                              "Esqueci minha senha",
                              textAlign: TextAlign.right,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        SizedBox(
                          height: 44.0,
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            textColor: Colors.white,
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {}
                              model.signIn(
                                  email: _emailController.text,
                                  pass: _passController.text,
                                  onSuccess: _onSuccess,
                                  onFail: _onFail);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  void _onSuccess() {
    Navigator.of(context).pop();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao Entrar!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
