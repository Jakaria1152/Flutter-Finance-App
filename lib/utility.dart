import 'package:flutter_finance_app/data/add_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:intl/intl.dart';

int totals=0;

final box = Hive.box<AddData>('data');

int total() {
  var history2 = box.values.toList();

  List<int> amounts = [0,0];

  for (var i = 0; i < history2.length; i++) {
    var amount = history2[i].amount;
    if (amount != null && amount.isNotEmpty) {
      amounts.add(history2[i].IN == 'Income'
          ? int.parse(amount)
          : -int.parse(amount));
    }
  }

  totals = amounts.reduce((value, element) => value + element);

  return totals;
}

int income() {
  var history2 = box.values.toList();

  List<int> amounts = [0,0];

  for (var i = 0; i < history2.length; i++) {
    var amount = history2[i].amount;
    if (amount != null && amount.isNotEmpty) {
      amounts.add(history2[i].IN == 'Income'
          ? int.parse(amount)
          : 0);
    }
  }

  totals = amounts.reduce((value, element) => value + element);

  return totals;
}
int expenses() {
  var history2 = box.values.toList();

  List<int> amounts = [0,0];

  for (var i = 0; i < history2.length; i++) {
    var amount = history2[i].amount;
    if (amount != null && amount.isNotEmpty) {
      amounts.add(history2[i].IN == 'Income'
          ? 0
          : -int.parse(amount));
    }
  }

  totals = amounts.reduce((value, element) => value + element);

  return totals;
}

List<AddData> today()
{
  List<AddData> a = [];
  var history2 = box.values.toList();
  DateTime date =  DateTime.now();
  for(var i=0; i<history2.length; i++)
    {
      if(history2[i].dateTime!.day == date.day)
        {
          a.add(history2[i]);
        }
    }
  return a;
}

List<AddData> week()
{
  List<AddData> a = [];
  var history2 = box.values.toList();
  DateTime date =  DateTime.now();
  for(var i=0; i<history2.length; i++)
  {
    if(date.day-7 <= history2[i].dateTime!.day && history2[i].dateTime!.day <=date.day)
    {
      a.add(history2[i]);
    }
  }
  return a;
}

List<AddData> month()
{
  List<AddData> a = [];
  var history2 = box.values.toList();
  DateTime date = DateTime.now();
  for(var i=0; i<history2.length; i++)
  {
    if(history2[i].dateTime!.month == date.month)
    {
      a.add(history2[i]);
    }
  }
  return a;
}

List<AddData> year()
{
  List<AddData> a = [];
  var history2 = box.values.toList();
  DateTime date = DateTime.now();
  for(var i=0; i<history2.length; i++)
  {
    if(history2[i].dateTime!.year == date.year)
    {
      a.add(history2[i]);
    }
  }
  return a;
}

int total_chart(List<AddData> history2) {


  List<int> amounts = [0,0];

  for (var i = 0; i < history2.length; i++) {
    var amount = history2[i].amount;
    if (amount != null && amount.isNotEmpty) {
      amounts.add(history2[i].IN == 'Income'
          ? int.parse(amount)
          : -int.parse(amount));
    }
  }

  totals = amounts.reduce((value, element) => value + element);

  return totals;
}



String typeTime(){
  DateTime now = DateTime.now();
  String formattedTime = DateFormat.Hm().format(now); // 24-hour format
  if (now.hour < 12) {
    return 'Good morning !';
  } else if (now.hour < 18) {
    return 'Good afternoon !';
  } else {
    return 'Good evening !';
  }
}

// Daily Food amount for Piechart
int todayFood()
{
  List<AddData> a = today();
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
int todayEducation()
{
  List<AddData> a = today();
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
int todayTransportation()
{
  List<AddData> a = today();
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
int todayTransfer()
{
  List<AddData> a = today();
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

List<int> maxYFind()
{
  List<AddData> a = [];
  List<int> income = [0,0];
  List<int> outcome = [0,0];
  List<int> outcomeOptional = [0,0];
  List<int> total_balance = [0,0];
  var history2 = box.values.toList();
  DateTime date =  DateTime.now();
  for(var i=0; i<history2.length; i++)
  {
    if(date.day-7 <= history2[i].dateTime!.day && history2[i].dateTime!.day <=date.day)
    {
      a.add(history2[i]);
    }
  }

  for (var i = 0; i < a.length; i++) {
    var amount = a[i].amount;
    if (amount != null && amount.isNotEmpty) {
      income.add(a[i].IN == 'Income'
          ? int.parse(amount)
          : 0);

      outcome.add(a[i].IN == 'Outcome'
          ? int.parse(amount)
          : 0);

      outcomeOptional.add(a[i].IN == 'Outcome'
          ? -int.parse(amount)
          : int.parse(amount));
    }
  }
  int totalBalance = outcomeOptional.reduce((value, element) => value + element);
  // int mintotalBalance = outcomeOptional.reduce((min, element) => min < element ? min : element);
  int maxIncome =  income.reduce((value, element) => value > element ? value : element);
  // int minIncome = income.reduce((min, element) => min < element ? min : element);
  int maxOutcome =  outcome.reduce((value, element) => value > element ? value : element);
  // int minOutcome = outcome.reduce((min, element) => min < element ? min : element);

  int maxValue = [totalBalance, maxIncome, maxOutcome].reduce((max, value) => max > value ? max : value);
  // int minValue = [totalBalance, maxIncome, maxOutcome].reduce((min, value) => min < value ? min : value);
  int range = maxValue-0;
  double x = range/5;
  int interval = x.toInt();
  return [0,maxValue,interval];

}