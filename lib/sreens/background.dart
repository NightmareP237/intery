import 'package:flutter/material.dart';

class backgroundimage extends StatelessWidget {
  const backgroundimage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height * 0.58,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(colors: [
            Colors.black,
            Colors.white,
          ], begin: Alignment.bottomCenter, end: Alignment.center)
              .createShader(bounds),
          blendMode: BlendMode.softLight,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage('images/frank.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.orange.shade200, BlendMode.darken)),
            ),
          ),
        ),
      ),
    );
  }
}
