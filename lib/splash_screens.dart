import 'dart:async';

import 'package:calculator_app_flutter/screens/home.dart';
import 'package:flutter/material.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {

  void initState(){
  super.initState();
  Timer(const Duration(seconds:3), () => Navigator.pushReplacement( context,
        MaterialPageRoute(
          builder: (context) => const Home()),
  )
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.deepPurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
            Icons.calculate_rounded,
            size: 80,
            color: Colors.white,
            ),
            SizedBox(height: 20,),
            Text("CALCULATOR APP",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40, 
            fontWeight: FontWeight.bold),)
          ],
          
        ),
      ),
    );
  }
}