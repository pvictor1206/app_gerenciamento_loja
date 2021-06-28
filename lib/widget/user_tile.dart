import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  //const UserTile({Key? key}) : super(key: key);

  final textStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "title",
        style: textStyle,
      ),
      subtitle: Text(""
          "subtile",
      style: textStyle,),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Pedidos: 0",
            style: textStyle,
          ),
          Text("Gastos: 0",
          style: textStyle,
          )
        ],
      ),
    );
  }
}
