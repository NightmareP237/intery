import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user.dart';

class DBServices {
  final CollectionReference usercol =
  FirebaseFirestore.instance.collection("users");


  Future saveUser(UserSave user) async {
    try {
      await usercol.doc(user.uid).set(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
  Future getUser(String id) async {
    try {
      final data = await usercol.doc(id).get();
      return data.data();
    } catch (e) {
      return false;
    }
  }
//   appuserdata userfromsnapshot(DocumentSnapshot snapshot){
//     return appuserdata(email: snapshot.data()!.[('email')],
//      name:snapshot.data()!.['email'],
//       password:snapshot.data()!.['password'], uid:uid );
//   }
//   Stream<appuserdata> get User{
//     return usercol.doc(uid).snapshots().map((event) => userfromsnapshot);
//   }
}
