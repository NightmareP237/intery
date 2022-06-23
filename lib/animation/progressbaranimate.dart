import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class progressanimate extends StatefulWidget {
  const progressanimate({Key? key}) : super(key: key);
  @override
  State<progressanimate> createState() => _progressanimateState();
}

class _progressanimateState extends State<progressanimate> {
  @override
  bool isLoading = false;
  bool trech = false;
  bool isdone = true;
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(72),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () async {
              setState(() => isLoading = true);
              await Future.delayed(Duration(seconds: 2));
              setState(() => isLoading = false);
              setState(() => trech = true);
              await Future.delayed(Duration(seconds: 5));
              setState(() => trech = false);
            },
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 24),
              minimumSize: Size.fromHeight(72),
              shape: StadiumBorder(),
            ),
            child: isLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        '  Wait...',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                : Text(
                    'paiement',
                    style: TextStyle(color: Colors.white),
                  ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: trech
                ? Container(
                    child: AlertDialog(
                      insetPadding: EdgeInsets.all(5),
                      title: Row(
                        children: [
                          Text(
                            'Success',
                            style: TextStyle(color: Colors.green, fontSize: 18),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            Icons.done,
                            size: 25,
                            color: Colors.green,
                          )
                        ],
                      ),
                      content: Text(
                        'Paiement effectue avec success!!',
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }

  Widget buildsmallbutton(bool isdone) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.amber,
      ),
      child: Center(
          child: isdone
              ? Icon(
                  Icons.done,
                  size: 52,
                  color: Colors.white,
                )
              : null),
    );
  }

  Widget buildbutton() => OutlinedButton(
      onPressed: null,
      style: OutlinedButton.styleFrom(
          shape: StadiumBorder(),
          side: BorderSide(width: 2, color: Colors.grey)),
      child: Text(
        'Paiement effectue avec success!!',
        style: TextStyle(
          fontSize: 24,
          color: Colors.green,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w600,
        ),
      ));
}
