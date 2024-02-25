import 'package:flutter_finance_app/utility.dart';
import 'package:hive/hive.dart';

import 'data/add_data.dart';

final box = Hive.box<AddData>('data');
int monthFood()
{
  List<AddData> a = month();
  int food=0;

  List<int> amounts = [0,0];

  for (var i = 0; i < a.length; i++) {
    var amount = a[i].amount;
    if (amount != null && amount.isNotEmpty) {
      amounts.add(a[i].name == 'Food'
          ? int.parse(amount)
          : 0);
    }
  }

  food = amounts.reduce((value, element) => value + element);

  return food;

}

//Daily Education amount
int monthEducation()
{
  List<AddData> a = month();
  int education=0;

  List<int> amounts = [0,0];

  for (var i = 0; i < a.length; i++) {
    var amount = a[i].amount;
    if (amount != null && amount.isNotEmpty) {
      amounts.add(a[i].name == 'Education'
          ? int.parse(amount)
          : 0);
    }
  }

  education = amounts.reduce((value, element) => value + element);

  return education;

}

//Daily Transpostation amount
int monthTransportation()
{
  List<AddData> a = month();
  int transportation=0;

  List<int> amounts = [0,0];

  for (var i = 0; i < a.length; i++) {
    var amount = a[i].amount;
    if (amount != null && amount.isNotEmpty) {
      amounts.add(a[i].name == 'Transportation'
          ? int.parse(amount)
          : 0);
    }
  }

  transportation = amounts.reduce((value, element) => value + element);

  return transportation;

}
//daily Transfer amount
int monthTransfer()
{
  List<AddData> a = month();
  int transfer=0;

  List<int> amounts = [0,0];

  for (var i = 0; i < a.length; i++) {
    var amount = a[i].amount;
    if (amount != null && amount.isNotEmpty) {
      amounts.add(a[i].name == 'Transfer'
          ? int.parse(amount)
          : 0);
    }
  }

  transfer = amounts.reduce((value, element) => value + element);

  return transfer;

}