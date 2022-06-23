import 'package:firebase_auth/firebase_auth.dart';

class authservices {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future signAnonimous() async {
    try {
      final result = await auth.signInAnonymously();
      return result.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> get user async {
    final user = FirebaseAuth.instance.currentUser;
    return user;
  }

  Future<bool> signup(String email, String password) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var user = result.user;
      if (user != null) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  Future signout() async {
    try {
      return auth.signOut();
    } catch (e) {
      return null;
    }
  }

  Future<bool> signin(String email, String pass) async {
    try {
      final result =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      if (result.user != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
