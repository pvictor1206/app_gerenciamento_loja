import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      child: Card(
        child: ExpansionTile(
          title: Text(
            "033311 - Entregue",
            style: TextStyle(color: Colors.green),
          ),
          children: [
            Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 0,bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text("Camiseta Preta P"),
                        subtitle: Text("Camiseta/fdfdsfdsfs"),
                        trailing: Text(
                          "2",
                          style: TextStyle(fontSize: 20),
                        ),
                        contentPadding: EdgeInsets.zero,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                          onPressed: (){},
                          textColor: Colors.red,
                          child: Text("Excluir")),
                      FlatButton(
                          onPressed: (){},
                          textColor: Colors.grey[850],
                          child: Text("Voltar")),
                      FlatButton(
                          onPressed: (){},
                          textColor: Colors.green,
                          child: Text("Avançar")),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
