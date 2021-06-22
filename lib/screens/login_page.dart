import 'package:app_gerenciamento_loja/blocs/login_bloc.dart';
import 'package:app_gerenciamento_loja/widget/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      //Faz com que a tela gire..
      body: Stack(
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
                            onPressed: snapshot.hasData ? () {}: null,
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
      ),
    );
  }
}
