// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';

// // ignore: use_key_in_widget_constructors
// class picker extends StatefulWidget {
//   const picker({Key? key}) : super(key: key);

//   @override
//   _pickerState createState() => _pickerState();

//   static getImage({required ImageSource source}) {}
// }

// class _pickerState extends State<picker> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

//   late File _images;
//   Future getImage() async {
//     final image = await ImagePicker().getImage(source: ImageSource.camera);

//     setState(() {
//       _images = File(image!.path);
//     });
//     // }
//     File _imgFile;
//     final imagePicker = ImagePicker();
//     _openGallery(BuildContext context) async {
//       final imgFile = await imagePicker.getImage(source: ImageSource.gallery);
//       this.setState(() {
//         _imgFile = File(imgFile!.path);
//       });
//       Navigator.of(context).pop();
//     }

//     _openCamera(BuildContext context) async {
//       final imgFile = await imagePicker.getImage(source: ImageSource.camera);
//       this.setState(() {
//         _imgFile = File(imgFile!.path);
//       });
//       Navigator.of(context).pop();
//     }

//     //Boite de dialogue camera
//     Future<void> _showDialog(BuildContext context) {
//       // ignore: missing_return
//       return showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text(
//                 "Choississez votre source",
//                 style: GoogleFonts.arimo(
//                   fontSize: 15,
//                 ),
//               ),
//               content: SingleChildScrollView(
//                 child: ListBody(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: GestureDetector(
//                         child: Row(
//                           children: [
//                             Icon(
//                               FontAwesomeIcons.camera,
//                               color: Colors.orange,
//                             ),
//                             SizedBox(width: 10.0),
//                             Text(
//                               "Camera",
//                               style: GoogleFonts.arizonia(fontSize: 18),
//                             ),
//                           ],
//                         ),
//                         onTap: () {
//                           _openCamera(context);
//                         },
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: GestureDetector(
//                         child: Row(
//                           children: [
//                             Icon(FontAwesomeIcons.image, color: Colors.orange),
//                             SizedBox(width: 10.0),
//                             Text(
//                               "Gallery",
//                               style: GoogleFonts.arizonia(fontSize: 18),
//                             ),
//                           ],
//                         ),
//                         onTap: () {
//                           _openGallery(context);
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           });

//       // @override
//       // Widget build(BuildContext context) {
//       //   return Scaffold(
//       //     appBar: AppBar(
//       //       title: Text("Camera and Gallery", style: TextStyle(color: Colors.black38),),
//       //       backgroundColor: Colors.white,
//       //     ),
//       //     body: Center(
//       //       child:  SizedBox(
//       //           width: 100.0,height: 100.0,
//       //           // ignore: unnecessary_null_comparison
//       //           child: _imgFile == null ? Text ("No Image Selected") : Image.file(_imgFile))),
//       //  floatingActionButton: FloatingActionButton(
//       //     onPressed: (){_showDialog(context);},
//       //     backgroundColor: Colors.white,
//       //     child: Icon(Icons.camera, color: Colors.deepOrange,),
//       //   ),
//       //   );
//       // }

//       Future<void> _showDialog(BuildContext context) {
//         // ignore: missing_return
//         return showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text(
//                   "Quel langue parlez-vous ?",
//                   style: TextStyle(fontStyle: FontStyle.italic),
//                 ),
//                 content: SingleChildScrollView(
//                   child: ListBody(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: GestureDetector(
//                           child: Row(
//                             children: [
//                               // Icon(FontAwesomeIcons., color: Color(Orange),),
//                               SizedBox(width: 10.0),
//                               Text(
//                                 "Français",
//                                 style: TextStyle(fontStyle: FontStyle.italic),
//                               ),
//                             ],
//                           ),
//                           onTap: () {},
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: GestureDetector(
//                           child: Row(
//                             children: [
//                               // Icon(FontAwesomeIcons.image, color: Color(Orange)),
//                               SizedBox(width: 10.0),
//                               Text(
//                                 "English",
//                                 style: TextStyle(fontStyle: FontStyle.italic),
//                               ),
//                             ],
//                           ),
//                           onTap: () {},
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             });
//       }
//     }
//   }
// }
