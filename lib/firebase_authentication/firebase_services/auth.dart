import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_application/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool> addCoin(String id, double amount,double change_percent,String symbol,String sign) async {
    try {
      
      String uid = FirebaseAuth.instance.currentUser.uid;
      double value = amount;
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .collection('Coins')
          .doc(id);
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);
       
        if (!snapshot.exists) {
          documentReference.set({"Amount_in_USD": value,
          "change_percent":change_percent,
          "symbol":symbol ,
          "sign":sign});
          return true;
        }
        return true;
      });
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeCoin(String id) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Coins')
        .doc(id)
        .delete();
    return true;
  }

  //create user object from firebaseuser

  CustomUser? _userFromFirebaseUser(User user) {
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  //auth change user stream
  //Using Streams
  Stream<CustomUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //sign in Anonmously
  Future signInAnon() async {
    try {
      UserCredential result;
      result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with Email and Password
  Future signinWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      print("error in this method sign in");
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      print("error in this method");
      return null;
    }
  }

  //sign out
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("error");
      print(e.toString());
      return null;
    }
  }
}
