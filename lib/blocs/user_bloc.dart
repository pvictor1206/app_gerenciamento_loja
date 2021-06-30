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
            //_users[uid] = change.doc.data();
            break;
          case DocumentChangeType.modified:
            _users[uid]!.addAll(change.doc.data as Map<String, dynamic>);
            break;
          case DocumentChangeType.removed:
            _users.remove(uid);
            break;
        }
      });
    });
  }

  @override
  void dispose() {
    _usersController.close();
    super.dispose();
  }


}
