import 'package:flutter/material.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:interyapp/pages/driver/constants.dart';
import 'package:interyapp/pages/driver/model/car.dart';
import 'package:interyapp/pages/driver/select_hour.dart';
import 'package:interyapp/pages/driver/widget/attribute.dart';
import 'package:interyapp/pages/driver/widget/rating_bar.dart';

class CarDetailInfomation extends StatelessWidget {
  const CarDetailInfomation({
    required this.car,
  });
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height/33),
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/18),
      decoration: BoxDecoration(
          color: mPrimaryColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          CarInfo(car: car),
          Divider(
            height: MediaQuery.of(context).size.height/40,
            color: Colors.black54,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/av.png',
                height: MediaQuery.of(context).size.height/5,
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  children: [
                    DriverInfo(),
                    SizedBox(
                      height: 12,
                    ),
                    DiverAppraise(),
                    SizedBox(
                      height: 12,
                    ),
                    DriverCall(),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class DriverCall extends StatelessWidget {
  const DriverCall();

  @override
  Widget build(BuildContext context) {
int count=0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:5),
          child: FlatButton(
            onPressed: ()=>nav(Date(), context),
            color: Color(0xFF203e5a),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Reservez',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DiverAppraise extends StatelessWidget {
  const DiverAppraise();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '5.0',
          style: TextStyle(),
        ),
        SizedBox(
          width: 6,
        ),
        RatingBar(
          padding: 0,
          onRatingUpdate: (value) {
            
          },
          size: 14,
          selectColor: Colors.white,
        ),
      ],
    );
  }
}

class DriverInfo extends StatelessWidget {
  const DriverInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jesica Smith',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'License NWR 369852',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '369',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Ride',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CarInfo extends StatelessWidget {
  const CarInfo({
    required this.car,
  });

 final Car car;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              name: 'Model',
              textColor: Colors.black87,
            ),
            Attribute(
              value: car.model,
              name: 'No Serie',
              textColor: Colors.black87,
            ),
            Attribute(
              value: car.co2,
              name: 'CO2',
              textColor: Colors.black87,
            ),
            Attribute(
              value: car.fuelCons,
              name: 'Quantite',
              textColor: Colors.black87,
            ),
          ],
        )
      ],
    );
  }
}
