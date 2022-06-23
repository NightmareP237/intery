
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'navigator.dart';

class category extends StatefulWidget {
  category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  int selectedindex = 0;

  List categori = [
    'Nos Services',
    'E-commerce',
    'Plombery',
    'Electricite',
    'Driver',
    'Salubrite',
    'Sante',
    'Education',
    'Restauration',
    'Decoration'
  ];
  List navige = [
    home(),
    navigate(),
    navigate(),
    navigate(),
    navigate(),
    navigate(),
    navigate(),
    navigate(),
    navigate(),
    navigate(),
  ];

  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02),
        height: 40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categori.length&navige.length,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedindex = index;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => navige[index]));
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: 15,
                        right: index == categori.length & navige.length - 1
                            ? 10
                            : 0),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        color: index == selectedindex
                            ? Colors.white.withOpacity(.4)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(6)),
                    child: Text(
                      categori[index],
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )));
  }
}
