import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends BlocBase {


  final _usersController = BehaviorSubject();
  Map<String, Map<String, dynamic>> _users = {};

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserBloc(){
    _addUsersListener();
  }

  void _addUsersListener(){
    _firestore.collection("users").snapshots().listen((snapshot) {
      snapshot.docChanges.forEach((change) {

        String uid = change.doc.id;

        switch(change.type){
          case DocumentChangeType.modified:
            _users[uid] =  change.doc.data as Map<String, dynamic>;
            _subscribeToOrders(uid);
            //_users[uid] = change.doc.data();
            break;
          case DocumentChangeType.modified:
            _users[uid]!.addAll(change.doc.data as Map<String, dynamic>);
            _usersController.add(_users.values.toList());
            break;
          case DocumentChangeType.removed:
            _users.remove(uid);
            _unsubscribeToOrders(uid);
            _usersController.add(_users.values.toList());
            break;
        }
      });
    });
  }

  void _subscribeToOrders(String uid) {
    _users[uid]["subscription"] = _firestore.collection("users").doc(uid).collection("orders")
        .snapshots().listen((orders) async {

          int numOrders = orders.docs.length;

          double money = 0.0;

          for(DocumentSnapshot d in orders.docs){
            DocumentSnapshot order = await _firestore.collection("orders")
                .doc(d.id).get();

            if(order.data() == null) continue;

            // precisa de dados primeiro
            //money += order.data["totalPrice"];
          }

          _users[uid]!.addAll(
            {"money": money, "orders": numOrders}
          );

          _users[uid]!.addAll(_users.values.toList() as Map<String, dynamic>);

    });
  }

  void _unsubscribeToOrders(String uid){
    _users[uid]["subscription"].cancel();
  }

  @override
  void dispose() {
    _usersController.close();
    super.dispose();
  }


}
