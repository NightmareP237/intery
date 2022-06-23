import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

buttonside(String title,Color color,BuildContext context){
  return ElevatedButton(onPressed:  null,
   child: Text(title,
   style: TextStyle(fontSize: 16,
   color: Colors.white)
   ,),
   style:ButtonStyle(shape:MaterialStateProperty.all(
     RoundedRectangleBorder(
       side: BorderSide(
         color: Colors.orange.shade400, width: 2
       ),
       borderRadius: BorderRadius.circular(5)
     ),
   ),
    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height/35 ,horizontal: MediaQuery.of(context).size.height/35)),
    backgroundColor: MaterialStateProperty.all(color)
   ) ,
   );
}