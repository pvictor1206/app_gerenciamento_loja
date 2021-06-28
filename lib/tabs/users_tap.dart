import 'package:app_gerenciamento_loja/widget/user_tile.dart';
import 'package:flutter/material.dart';

class UsersTap extends StatelessWidget {
  const UsersTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          ),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index){
                return UserTile();
              },
              separatorBuilder: (context, index){
                return Divider();
              },
              itemCount: 5
          ),
        ),
      ],
    );
  }
}
