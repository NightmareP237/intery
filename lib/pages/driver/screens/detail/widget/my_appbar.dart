import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  // const MyAppbar({
  //   Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text(
            'I N T E R Y',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Badge(
       position: BadgePosition.topEnd(top: 25, end: 5,),
      badgeContent: Text('${0}',style: TextStyle(color: Colors.white),),
      animationDuration: Duration(milliseconds: 500),
      animationType: BadgeAnimationType.slide,
      badgeColor: Colors.red,
      child: IconButton(
              onPressed: () {
                print('tap');
              },
              icon: Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 30,
              ),
            ),
    )
        ],
      ),
    );
  }
}
