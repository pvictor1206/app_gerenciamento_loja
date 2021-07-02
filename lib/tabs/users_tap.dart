import 'package:app_gerenciamento_loja/blocs/user_bloc.dart';
import 'package:app_gerenciamento_loja/widget/user_tile.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_gerenciamento_loja/blocs/user_bloc.dart';

class UsersTap extends StatelessWidget {
  const UsersTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _userBloc =  BlocProvider.of<UserBloc>(context);


    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Pesquisar",
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              icon: Icon(Icons.search, color: Colors.white,),
              border: InputBorder.none,
            ),
            onChanged: _userBloc.onChangedSearch,
          ),
        ),
        Expanded(
          child: StreamBuilder<List>(
            stream: _userBloc.outUsers,
            builder: (context, snapshot) {
              if(snapshot.hasData)
                return Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
                );

              else if(snapshot.data!.length == 0)
                return Center(
                  child: Text("Nenhum usuário encontrado!",style: TextStyle(
                    color: Colors.blue
                  ),),
                );

              else
                return ListView.separated(
                    itemBuilder: (context, index){
                      return UserTile(snapshot.data[index]);
                    },
                    separatorBuilder: (context, index){
                      return Divider();
                    },
                    itemCount: snapshot.data.length
              );
            }
          ),
        ),
      ],
    );
  }
}
