// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class GoogleSignInProvider extends ChangeNotifier {
//   final googleSignIn = GoogleSignIn();
//   late bool _isSigningIn;

//   GoogleSignInProvide() {
//     _isSigningIn = false;
//   }

//   bool get isSigningIn => _isSigningIn;

//   set isSigningIn(bool isSigningIn) {
//     _isSigningIn = isSigningIn;
//     notifyListeners();
//   }

//   Future login() async {
//     isSigningIn = true;

//     final user = await googleSignIn.signIn();
//     if (user == null) {
//       isSigningIn = false;
//       return;
//     } else {
//       final googleAuth = await user.authentication;

//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       await FirebaseAuth.instance.signInWithCredential(credential);

//       isSigningIn = false;
//     }
//   }

//   void logout() async {
//     await googleSignIn.disconnect();
//     FirebaseAuth.instance.signOut();
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
// // // import 'package:flutter/foundation.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:provider/provider.dart';
// //
// // class GoogleSignInProvider extends ChangeNotifier{
// //   final googleSignIn = GoogleSignIn();
// //   bool _isSigningIn;
// //
// //   GoogleSignInProvider() {
// //     _isSigningIn = false;
// //   }
// //
// //   bool get isSigningIn => _isSigningIn;
// //
// //   set isSigningIn(bool isSigningIn) {
// //     _isSigningIn = isSigningIn;
// //     notifyListeners();
// //   }
// //
// //   Future login() async {
// //     isSigningIn = true;
// //
// //     final user = await googleSignIn.signIn();
// //     if (user == null) {
// //       isSigningIn = false;
// //       return;
// //     } else {
// //       final googleAuth = await user.authentication;
// //
// //       final credential = GoogleAuthProvider.credential(
// //         accessToken: googleAuth.accessToken,
// //         idToken: googleAuth.idToken,
// //       );
// //
// //       await FirebaseAuth.instance.signInWithCredential(credential);
// //
// //       isSigningIn = false;
// //     }
// //   }
// //
// //   void logout() async {
// //     await googleSignIn.disconnect();
// //     FirebaseAuth.instance.signOut();
// //   }
// // }
// //
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/foundation.dart';
// // // import 'package:google_sign_in/google_sign_in.dart';
// // // import 'package:flutter/material.dart';
// // // class GoogleSignInProvider extends ChangeNotifier {
// // // Future<void> signInWithGoogle() async {
// // //   final FirebaseAuth auth = FirebaseAuth.instance;
// // //   try {
// // //     UserCredential userCredential;
// // //
// // //     if (kIsWeb) {
// // //       var googleProvider = GoogleAuthProvider();
// // //       userCredential = await auth.signInWithPopup(googleProvider);
// // //     } else {
// // //       final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
// // //       final GoogleSignInAuthentication googleAuth =
// // //       await googleUser.authentication;
// // //       final googleAuthCredential = GoogleAuthProvider.credential(
// // //         accessToken: googleAuth.accessToken,
// // //         idToken: googleAuth.idToken,
// // //       );
// // //       userCredential = await auth.signInWithCredential(googleAuthCredential);
// // //     }
// // //     final user = userCredential.user;
// // //   } catch (e) {
// // //     print(e);
// // //   }
// // // }
// // // }