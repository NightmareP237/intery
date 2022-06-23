import 'package:flutter/material.dart';

class future extends StatefulWidget {
  const future({Key? key}) : super(key: key);

  @override
  _futureState createState() => _futureState();
}

class _futureState extends State<future> {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      strokeWidth: 4,
    );
  }
}
