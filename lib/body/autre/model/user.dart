class UserSave {
  final String? uid, UserName, Mail, Password, Image;
  //
  // final int phone;
  //  static User currentUser;
  UserSave({
     this.uid,
     this.UserName,
     this.Mail,
     this.Password,
     this.Image, 
    // this.phone,
  });
  factory UserSave.fromJson(Map) =>
   UserSave(
        uid: Map['uid'],
        Mail: Map['email'],
        Image: Map['image'],
        UserName: Map['username'],
        // phone: j['phone'],
        Password: Map['password'],
      );
  Map<String, dynamic> toMap() => {
        "uid": uid,
        "email": Mail,
        "username": UserName,
        // "phone": phone,
        "password": Password,
        "Image": Image,
      };
}
class appuserdata {
 late final String uid;
 late final String name;
 late final String email;
 late final String password;
 appuserdata({required this.email, required this.name,required this.password,required this.uid});
}
