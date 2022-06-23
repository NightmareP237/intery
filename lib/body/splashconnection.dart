import 'package:flutter/material.dart';
import 'package:interyapp/body/homepage.dart';

class connectsplash extends StatefulWidget {
  const connectsplash({Key? key}) : super(key: key);

  @override
  _connectsplashState createState() => _connectsplashState();
}

class _connectsplashState extends State<connectsplash> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text(
                'Intery Services',
                style: TextStyle(
                  color: Colors.orange.shade300,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(begin: Alignment.bottomCenter, colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.yellow.withOpacity(0.4),
                  Colors.orange.shade200,
                ]),
                image: DecorationImage(
                    image: AssetImage('login/goodconnexion.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text(
                'connexion reussie!!',
                style: TextStyle(
                  color: Colors.orange.shade300,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
