import 'package:app_gerenciamento_loja/widget/order_tile.dart';
import 'package:flutter/material.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        itemCount: 6,
          itemBuilder: (context, index){
            return OrderTile();
          }
      ),
    );
  }
}
