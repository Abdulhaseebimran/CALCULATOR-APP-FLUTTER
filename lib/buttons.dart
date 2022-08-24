import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key,
   this.color,
  this.textcolor,
  required this.buttontext, 
  this.buttonTapped}) : 
  super(key: key);

  final color;
  final textcolor;
  final String buttontext;
  final buttonTapped;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(buttontext, style: TextStyle(
                color: textcolor, 
              ),),
            ),
          ),
        ),
      ),
    );
  }
}