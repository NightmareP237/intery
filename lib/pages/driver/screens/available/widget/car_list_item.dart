import 'package:flutter/material.dart';
import 'package:interyapp/pages/driver/constants.dart';
import 'package:interyapp/pages/driver/model/car.dart';
import 'package:interyapp/pages/driver/screens/available/widget/car_infomation.dart';
import 'package:interyapp/pages/driver/screens/detail/car_detail_screen.dart';

class CarListItem extends StatelessWidget {
  const 
  CarListItem(
    this.index,
    // required Key key,
  );

  final int index;

  @override
  Widget build(BuildContext context) {
    Car car = carList[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CarDetailScreen(car);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            CarInfomation(car: car,),
            Positioned(
              right: MediaQuery.of(context).size.height/30,
              child: Image.asset(
                car.image,
                height:MediaQuery.of(context).size.height/7.2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
