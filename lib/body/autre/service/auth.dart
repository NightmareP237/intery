
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../model/user.dart';
import 'package:firebase_core/firebase_core.dart';

import 'database.dart';

class AuthService {
 final FirebaseAuth auth = FirebaseAuth.instance;

 Future signInAnon()async{
  try{
    final result = await auth.signInAnonymously();
    return result.user;
  }catch (e){
    print(e.toString());
    return null;
  }
 }
 Future<User?> get user async {
  late final user = FirebaseAuth.instance.currentUser;
   return user;
 }
 // Future<bool> signUp(String UserName,String Email, String Password) async {
 //   try{
 //     final result = await auth.createUserWithEmailAndPassword(email: Email, password: Password);
 //     if(result.user != null) return true;
 //     return false;
 //   } catch (e){
 //     return false;
 //
 //   }
 // }
 Future<bool> signIn(String Mail, String Pass) async {
   try{
     final result = await auth.signInWithEmailAndPassword(email: Mail, password: Pass);
     if(result.user != null) return true;
     return false;
   } catch (e){
     return false;

   }
 }


Future<String>getcurrentuser() async{
  return ( await FirebaseAuth.instance.currentUser!.uid);
}

 // User _userFromFirebaseUser(FirebaseUser user){
 //   return user != null ? User(uid: user.uid)
 // }



  Future<bool> signUp(  String UserName,String Email ,  String Password) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: Email, password: Password);
      if (result.user != null) {
        await DBServices().saveUser(UserSave(
            uid: result.user!.uid,
            Mail: Email,
            UserName: UserName,
            // phone: phone, 
            Image:UserName,     
            Password: Password));
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }


//   Future<bool> signIn(String email, String pass) async {
//     try {
//       final result = await auth.signInWithEmailAndPassword(email: email, password: pass);
//       if (result.user != null) return true;
//       return false;
//     } catch (e) {
//       return false;
//     }
//   }
//
  Future<bool> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future signOut() async {
    try {
      return auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
