
import 'package:flutter/material.dart';
import 'package:interyapp/pages/driver/constants.dart';
import 'package:interyapp/pages/driver/model/car.dart';
import 'package:interyapp/pages/driver/widget/attribute.dart';

class CarInfomation extends StatelessWidget {
  const CarInfomation({
    // required Key key,
    required this.car,
  });

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left:MediaQuery.of(context).size.height/50, 
      right: MediaQuery.of(context).size.height/50,
      top: MediaQuery.of(context).size.height/25),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: mCardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${car.price}000 Fcfa',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'prix/jour',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Attribute(
                value: car.brand,
                name: 'Marque',
              ),
              Attribute(
                value: car.model,
                name: 'No Serie',
              ),
              Attribute(
                value: car.co2,
                name: 'CO2',
              ),
              Attribute(
                value: car.fuelCons,
                name: 'Quantite',
              ),
            ],
          )
        ],
      ),
    );
  }
}

