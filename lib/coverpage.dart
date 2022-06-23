import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'login.dart';
import 'nextpages.dart';

class splash extends StatefulWidget {
  @override
  const splash({Key? key}) : super(key: key);
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loginpage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: 0,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage(
                  'images/dark.png',
                ),
                fit: BoxFit.fitWidth,
                colorFilter:
                    ColorFilter.mode(Colors.black, BlendMode.softLight)),
          ),
        ),
      ),
    );
  }
}

class loginpage extends StatelessWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        Stack(children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.symmetric(vertical: 0),
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(begin: Alignment.bottomCenter, colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.yellow.withOpacity(0.4),
                  Colors.orange.shade200,
                ]),
                image: DecorationImage(
                  image: AssetImage('images/f.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.02,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginSignupScreen()));
                },
                // LoginSignupScreen()
                child: Row(
                  children: [
                    Text(
                      "Passer",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                )),
          ),
        ]),
      ]),
    );
  }
}

// class chargement extends StatefulWidget {
//   const chargement({Key? key}) : super(key: key);

//   @override
//   _chargementState createState() => _chargementState();
// }

// class _chargementState extends State<chargement> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     Timer(Duration(seconds: 6), () {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) =>HomeScreen2() ));
//     });
//     super.initState();
//   }
// //loginpage()
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: CircularProgressIndicator(
//                   color: Colors.orange.shade200,
//                 )
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Text(
//                 'Chargement...',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.orangeAccent.shade200,
//                   fontStyle: FontStyle.italic,
//                   wordSpacing: 1.5,
//                   letterSpacing: 1.25,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
