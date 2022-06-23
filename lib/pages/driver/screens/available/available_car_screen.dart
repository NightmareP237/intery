import 'package:flutter/material.dart';
import 'package:interyapp/body/homepage.dart';
import 'package:interyapp/pages/driver/constants.dart';
import 'package:interyapp/pages/driver/screens/available/widget/car_list_item.dart';

class AvailableCarScreen extends StatefulWidget {
  @override
  State<AvailableCarScreen> createState() => _AvailableCarScreenState();
}

class _AvailableCarScreenState extends State<AvailableCarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: ListView.builder(
        itemCount: carList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical:20.0),
          child: CarListItem(index,),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange.shade500,
      elevation: 0,
      centerTitle: true,
      title: Text('Automobiles',style: TextStyle(color: Colors.white),),
      leading: IconButton(onPressed: (){
              Navigator.push((context), MaterialPageRoute(builder: (_)=>home()));
            }, icon: Icon(Icons.arrow_back)),
      actions: [
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            showBottomSheet(context: context, builder: (_)=>AlertDialog(
              title: Text('Intery Services',style: TextStyle(color: Colors.orange.shade400),),
              content: Container(
              ),
            ));
          },
        )
      ],
    );
  }
}

