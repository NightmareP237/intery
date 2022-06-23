
import 'package:flutter/material.dart';

class pick extends StatelessWidget {
  const pick({ Key? key }) : super(key: key);

  get dateformat => null;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.orange.shade300),
        onPressed: () {
          showDatePicker(
            context: context,
            firstDate: DateTime(2021),
            lastDate: DateTime(2025),
            initialDate: DateTime.now()
          ).then((DateTime? value) {
            if (value != null) {
              DateTime fromrange =  DateTime.now();
              fromrange = value;
              final String range =dateformat.MMMyD().format(fromrange);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('vous avez selectionner la date: $range'),backgroundColor: Colors.white,));
            }
          });
        },
        child: Text('Date du rendez-vous'));
  }
}