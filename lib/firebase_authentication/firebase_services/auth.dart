import 'package:crypto_application/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show AuthResult, FirebaseAuth, FirebaseUser;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object from firebaseuser

  CustomUser? _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  //auth change user stream
  //Using Streams
  Stream<CustomUser?> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in Anonmously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign in with Email and Password

  //register with email and password

  //sign out
}
