import 'package:app_gerenciamento_loja/blocs/login_bloc.dart';
import 'package:app_gerenciamento_loja/widget/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();
    
    _loginBloc.outState.listen((state) {
      switch(state){
        case LoginState.SUCCESS:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage())
          );
          break;
        case LoginState.FAIL:
          showDialog(context: context, builder: (context) => AlertDialog(
            title: Text("Erro"),
            content: Text("Você não possui os privilegios necessarios"),
          ));
          break;
        case LoginState.LOADING:
        case LoginState.IDLE:

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      //Faz com que a tela gire..
      body: StreamBuilder<LoginState>(
        stream: _loginBloc.outState,
        initialData: LoginState.LOADING,
        builder: (context, snapshot) {
          switch(snapshot.data){
            case LoginState.LOADING:
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              );
            case LoginState.FAIL:
            case LoginState.SUCCESS:
            case LoginState.IDLE:
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          Icons.store_mall_directory,
                          color: Colors.blue,
                          size: 160,
                        ),
                        InputField(
                          icon: Icons.person_outline,
                          hint: "Usuário",
                          obscure: false,
                          stream: _loginBloc.outEmail,
                          onChanged: _loginBloc.changeEmail,
                        ),
                        InputField(
                          icon: Icons.lock_outline,
                          hint: "Senha",
                          obscure: true,
                          stream: _loginBloc.outPassword,
                          onChanged: _loginBloc.changePasswird,
                        ),
                        SizedBox(height: 32,),
                        StreamBuilder<bool>(
                            stream: _loginBloc.submitValid,
                            builder: (context, snapshot) {
                              return SizedBox(
                                width: 50,
                                child: RaisedButton(
                                  color: Colors.blue,
                                  child: Text("Entrar"),
                                  onPressed: snapshot.hasData ? _loginBloc.submit: null,
                                  textColor: Colors.white,
                                  disabledColor: Colors.blue.withAlpha(140),
                                ),
                              );
                            }
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );

          }
          return Container(
            child: Text("ERRO: 1206"),
          );
        }
      ),
    );
  }
}
