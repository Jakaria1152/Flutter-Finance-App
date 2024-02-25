import 'package:flutter_finance_app/utility.dart';
import 'package:hive/hive.dart';

import 'data/add_data.dart';

final box = Hive.box<AddData>('data');

List<int> Mon()
{
  List<int> montotalAmount=[0,0];
  List<int> monInAmount=[0,0];
  List<int> monOutAmount=[0,0];
  List<AddData> a = week();
  for (var i = 0; i < a.length; i++) {
    int aa = ((a[i].dateTime?.day)!%7);
    var amount = a[i].amount;
    if (amount != null && amount.isNotEmpty) {
      montotalAmount.add(aa == 1
          ? a[i].IN=='Income'?int.parse(amount):-int.parse(amount)
          : 0);

      monInAmount.add(aa == 1
          ? a[i].IN=='Income'?int.parse(amount):0
          : 0);

      monOutAmount.add(aa == 1
          ? a[i].IN=='Income'?0:int.parse(amount)
          : 0);
    }
  }
  int totalAmount = montotalAmount.reduce((value, element) => value + element);
  int InAmount = monInAmount.reduce((value, element) => value + element);
  int OutAmount = monOutAmount.reduce((value, element) => value + element);

  return [InAmount, OutAmount, totalAmount];
}

List<int> Tue()
{
  List<int> TuetotalAmount=[0,0];
  List<int> TueInAmount=[0,0];
  List<int> TueOutAmount=[0,0];
  List<AddData> a = week();
  for (var i = 0; i < a.length; i++) {
    int aa = ((a[i].dateTime?.day)!%7);
    var amount = a[i].amount;
    if (amount != null && amount.isNotEmpty) {
      TuetotalAmount.add(aa == 2
          ? a[i].IN=='Income'?int.parse(amount):-int.parse(amount)
          : 0);

      TueInAmount.add(aa == 2
          ? a[i].IN=='Income'?int.parse(amount):0
          : 0);

      TueOutAmount.add(aa == 2
          ? a[i].IN=='Income'?0:int.parse(amount)
          : 0);
    }
  }
  int totalAmount = TuetotalAmount.reduce((value, element) => value + element);
  int InAmount = TueInAmount.reduce((value, element) => value + element);
  int OutAmount = TueOutAmount.reduce((value, element) => value + element);

  return [InAmount, OutAmount, totalAmount];
}

List<int> Wed()
{
  List<int> WedtotalAmount=[0,0];
  List<int> WedInAmount=[0,0];
  List<int> WedOutAmount=[0,0];
  List<AddData> a = week();
  for (var i = 0; i < a.length; i++) {
    int aa = ((a[i].dateTime?.day)!%7);
    var amount = a[i].amount;
    if (amount != null && amount.isNotEmpty) {
      WedtotalAmount.add(aa == 3
          ? a[i].IN=='Income'?int.parse(amount):-int.parse(amount)
          : 0);

      WedInAmount.add(aa == 3
          ? a[i].IN=='Income'?int.parse(amount):0
          : 0);

      WedOutAmount.add(aa == 3
          ? a[i].IN=='Income'?0:int.parse(amount)
          : 0);
    }
  }
  int totalAmount = WedtotalAmount.reduce((value, element) => value + element);
  int InAmount = WedInAmount.reduce((value, element) => value + element);
  int OutAmount = WedOutAmount.reduce((value, element) => value + element);

  return [InAmount, OutAmount, totalAmount];
}

List<int> Thu()
{
  List<int> ThutotalAmount=[0,0];
  List<int> ThuInAmount=[0,0];
  List<int> ThuOutAmount=[0,0];
  List<AddData> a = week();
  for (var i = 0; i < a.length; i++) {
    int aa = ((a[i].dateTime?.day)!%7);
    var amount = a[i].amount;
    if (amount != null && amount.isNotEmpty) {
      ThutotalAmount.add(aa == 4
          ? a[i].IN=='Income'?int.parse(amount):-int.parse(amount)
          : 0);

      ThuInAmount.add(aa == 4
          ? a[i].IN=='Income'?int.parse(amount):0
          : 0);

      ThuOutAmount.add(aa == 4
          ? a[i].IN=='Income'?0:int.parse(amount)
          : 0);
    }
  }
  int totalAmount = ThutotalAmount.reduce((value, element) => value + element);
  int InAmount = ThuInAmount.reduce((value, element) => value + element);
  int OutAmount = ThuOutAmount.reduce((value, element) => value + element);

  return [InAmount, OutAmount, totalAmount];
}

List<int> Fri()
{
  int aa;
  List<int> FritotalAmount=[0,0];
  List<int> FriInAmount=[0,0];
  List<int> FriOutAmount=[0,0];
  List<AddData> a = week();
  for (var i = 0; i < a.length; i++) {
    var amount = a[i].amount;
    aa = ((a[i].dateTime?.day)!%7);
    if (amount != null && amount.isNotEmpty) {
      FritotalAmount.add(aa == 5
          ? a[i].IN=='Income'?int.parse(amount):-int.parse(amount)
          : 0);

      FriInAmount.add(aa == 5
          ? a[i].IN=='Income'?int.parse(amount):0
          : 0);

      FriOutAmount.add(aa == 5
          ? a[i].IN=='Income'?0:int.parse(amount)
          : 0);
    }
  }
  int totalAmount = FritotalAmount.reduce((value, element) => value + element);
  int InAmount = FriInAmount.reduce((value, element) => value + element);
  int OutAmount = FriOutAmount.reduce((value, element) => value + element);

  return [InAmount, OutAmount, totalAmount];
}

List<int> Sat()
{
  List<int> SattotalAmount=[0,0];
  List<int> SatInAmount=[0,0];
  List<int> SatOutAmount=[0,0];
  List<AddData> a = week();
  for (var i = 0; i < a.length; i++) {
    int aa = ((a[i].dateTime?.day)!%7);
    var amount = a[i].amount;
    if (amount != null && amount.isNotEmpty) {
      SattotalAmount.add(aa == 6
          ? a[i].IN=='Income'?int.parse(amount):-int.parse(amount)
          : 0);

      SatInAmount.add(aa == 6
          ? a[i].IN=='Income'?int.parse(amount):0
          : 0);

      SatOutAmount.add(aa == 6
          ? a[i].IN=='Income'?0:int.parse(amount)
          : 0);
    }
  }
  int totalAmount = SattotalAmount.reduce((value, element) => value + element);
  int InAmount = SatInAmount.reduce((value, element) => value + element);
  int OutAmount = SatOutAmount.reduce((value, element) => value + element);

  return [InAmount, OutAmount, totalAmount];
}

List<int> Sun()
{

  List<int> SuntotalAmount=[0,0];
  List<int> SunInAmount=[0,0];
  List<int> SunOutAmount=[0,0];
  List<AddData> a = week();
  for (var i = 0; i < a.length; i++) {
    int aa = ((a[i].dateTime?.day)!%7);
    var amount = a[i].amount;
    if (amount != null && amount.isNotEmpty) {

      SuntotalAmount.add(aa == 7
          ? a[i].IN=='Income'?int.parse(amount):-int.parse(amount)
          : 0);

      SunInAmount.add(aa == 7
          ? a[i].IN=='Income'?int.parse(amount):0
          : 0);

      SunOutAmount.add(aa == 7
          ? a[i].IN=='Income'?0:int.parse(amount)
          : 0);
    }
  }
  int totalAmount = SuntotalAmount.reduce((value, element) => value + element);
  int InAmount = SunInAmount.reduce((value, element) => value + element);
  int OutAmount = SunOutAmount.reduce((value, element) => value + element);

  return [InAmount, OutAmount, totalAmount];
}