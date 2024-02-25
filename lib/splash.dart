import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_finance_app/bottomnavigationbar.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      // if (mounted) {
      //  if multiple time apps open not show splash screen code here
      // }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>const Bottom()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      const CircleAvatar(
        radius: 95,
        backgroundImage: AssetImage('asset/images/splash.jpg'),

      ),
      const SizedBox(height: 20,),

      // Image.asset('asset/images/img_1.png'),

      Text('Flutter Finance App',style: TextStyle(
        fontWeight: FontWeight.bold,
fontSize: 26,
        color: Colors.blue.shade800,
      ),),
      const SizedBox(height: 50,),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 110,vertical: 18),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: LinearProgressIndicator(

          ),
        ),
      )
    ],
  ),
),
    );
  }
}
