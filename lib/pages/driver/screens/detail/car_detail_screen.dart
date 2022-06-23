import 'package:flutter/material.dart';
import 'package:interyapp/pages/driver/model/car.dart';
import 'package:interyapp/pages/driver/screens/detail/widget/my_appbar.dart';

import 'widget/car_detail_infomation.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car;

  CarDetailScreen(this.car);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/map.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            MyAppbar(),
            Positioned(
              left: MediaQuery.of(context).size.height/30,
              right: MediaQuery.of(context).size.height/30,
              bottom: MediaQuery.of(context).size.height/20,
              child: Stack(
                children: [
                  CarDetailInfomation(car: car),
                  Positioned(
                    right: 0,
                    child: Image.asset(
                      car.image,
                      height: MediaQuery.of(context).size.height/7.2,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

