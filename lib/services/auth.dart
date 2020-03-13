import 'package:firebase_auth/firebase_auth.dart';
import 'package:Covid_Norge/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance; // create instance of FirebaseAuth. Allow interaction with Firebase

  // based on FirebaseUser, create user-obj with custom defined user-model
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, email: user.email) : null;
  }

  // auth-change user-stream
  // When an auth change occurs we get back either null or an user-obj
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser); // return a stream which returns to us users whenever there's a change in authentication
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously(); // get authentication result from Firebase by making request via _auth
      FirebaseUser user = result.user; // give access to user-object
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password); // Firebase method
      FirebaseUser user = result.user;
      // turn to regular user
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // turn to regular user
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut(); // firebase built-in method
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
