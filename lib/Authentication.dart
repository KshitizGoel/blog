import 'dart:async';
import 'dart:core';
import "package:firebase_auth/firebase_auth.dart";

abstract class AuthImplementation{
  Future<String> signIn(String email, String password);
  Future<String> signUp(String email, String password);
  Future <String> getCurrentUser();
  Future<void > signOut();
}

class Auth implements AuthImplementation{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    User user = (await _firebaseAuth.signInWithEmailAndPassword(     //Possibility of error due to deprecated FirebaseUser method!
        email: email, password: password)).user;

    return user.uid;
  }

  Future<String> signUp(String email, String password) async{
    User user = (await _firebaseAuth.createUserWithEmailAndPassword(     //Possibility of error due to deprecated FirebaseUser method!
        email: email, password: password)).user;

    return user.uid;
  }

  Future <String> getCurrentUser() async{
    User user = await _firebaseAuth.currentUser;
    return user.uid;
  }

  Future<void > signOut() async{
    _firebaseAuth.signOut();
  }

  }