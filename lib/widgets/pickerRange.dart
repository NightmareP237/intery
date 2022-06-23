import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class picker extends StatelessWidget {
  const picker({Key? key}) : super(key: key);
  get dateformat => null;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.purple),
        onPressed: () {
          showDateRangePicker(
            context: context,
            firstDate: DateTime(2021),
            lastDate: DateTime(2022),
          ).then((DateTimeRange? value) {
            if (value != null) {
              DateTimeRange fromrange =
                  DateTimeRange(start: DateTime.now(), end: DateTime.now());
              fromrange = value;
              final String range =
                  '${dateformat.MMMyD().format(fromrange.start)}-${dateformat.MMMyD().format(fromrange.end)}';
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(range)));
            }
          });
        },
        child: Text('Date du rendez-vous'));
  }
}
