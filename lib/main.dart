import 'package:flutter/material.dart';

import 'package:flutter_finance_app/data/add_data.dart';

import 'package:flutter_finance_app/splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(AddDataAdapter());
  await Hive.openBox<AddData>('data');

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash()//Bottom(),
  ));
}


