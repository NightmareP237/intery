// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';


// class LoginWithFacebook {
//   bool isSignIn = false;
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   late User user;
//   FacebookLogin facebookLogin = FacebookLogin();
// Future<bool>() async {
//   final FacebookLoginResult result = await facebookLogin.logIn(['email']);
//   switch (result.status) {
//     case FacebookLoginStatus.cancelledByUser:
//       break;
//     case FacebookLoginStatus.error:
//       break;
//     case FacebookLoginStatus.loggedIn:
//       try {
//         await loginWithfacebook(result);
//       } catch (e) {
//         print(e);
//       }
//       break;
//   }
// }

//  loginWithfacebook(FacebookLoginResult result) async {
//   final FacebookAccessToken accessToken = result.accessToken;
//   AuthCredential credential =
//   FacebookAuthProvider.credential(accessToken.token);
//   var a = await _auth.signInWithCredential(credential);
//   // setState(() {
//   if(a != null){
//     isSignIn = true;
//     user = a.user!;}
//   // });
//   // }

//   // Future<void> FacebookSignout() async {
//   //   var s = await _auth.signOut().then((onValue) {
//   //     // setState(() {
//   //     facebookLogin.logOut();
//   //     isSignIn = false;
//   //     // });
//   //   });
//   // }
// }
// }
