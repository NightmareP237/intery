import 'package:flutter/material.dart';

class listcontent extends StatefulWidget {
  const listcontent({Key? key}) : super(key: key);

  @override
  _listcontentState createState() => _listcontentState();
}

class _listcontentState extends State<listcontent> {
  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      itemExtent: 75,
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (BuildContext context, int index) {
          if (index < 0 || index > 8) {
            return null;
          }
          return ListTile(
            leading: Text(
              '$index',
              style: TextStyle(fontSize: 50),
            ),
            tileColor: Colors.orange.shade300,
            title: Text('titre $index'),
            subtitle: Text('E-commerce'),
          );
        },
      ),
    );
  }
}
