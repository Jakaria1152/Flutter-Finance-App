
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_finance_app/graph/week.dart';
import 'package:flutter_finance_app/utility.dart';
import 'package:flutter_finance_app/utility_month.dart';
import 'package:flutter_finance_app/utility_year.dart';
import 'package:pie_chart/pie_chart.dart';

import 'add_data.dart';
class Chart extends StatefulWidget {
  int indexx;
   Chart({super.key,   required this.indexx});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  Map<String,double> dataMap = {
    "Food": todayFood().toDouble(),
    "Transfer":todayTransfer().toDouble(),
    "Transportation": todayTransportation().toDouble(),
    "Education": todayEducation().toDouble()

  };

  Map<String,double> dataMapMonth = {
    "Food": monthFood().toDouble(),
    "Transfer":monthTransfer().toDouble(),
    "Transportation": monthTransportation().toDouble(),
    "Education": monthEducation().toDouble()

  };

  Map<String,double> dataMapYear = {
    "Food": yearFood().toDouble(),
    "Transfer":yearTransfer().toDouble(),
    "Transportation": yearTransportation().toDouble(),
    "Education": yearEducation().toDouble()

  };
  List<AddData>? a;
 Future<Widget> loadChart()async{
   await Future.delayed(const Duration(milliseconds: 500));
   return LinearChartWeek();
 }
  @override
  Widget build(BuildContext context) {

    if (widget.indexx == 0) {
      return Container(
        height: 350,
        width: double.infinity,
child: PieChart(
    chartRadius: MediaQuery.of(context).size.width/1.1,
  dataMap: dataMap,
  legendOptions: const LegendOptions(
    legendPosition: LegendPosition.bottom
  ),
  chartValuesOptions: const ChartValuesOptions(
    showChartValuesInPercentage: true
  ),
),
      );
    }
    else if (widget.indexx == 1) {
      return Container(
        height: 350,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 310,
              width: double.infinity,
              child: FutureBuilder<Widget>(
                future: loadChart(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done)
                    {

                      return LinearChartWeek();
                    }
                  else{

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          color: Colors.indigo,
                        ),
                        const SizedBox(width: 3,),
                        const Text('Income',style: TextStyle(fontSize: 15,color: Colors.indigo),)
                      ],
                    ),
                    const SizedBox(width: 8,),
                    Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 3,),
                        const Text('Outcome',style: TextStyle(fontSize: 15,color: Colors.green),)
                      ],
                    ),
                    const SizedBox(width: 8,),
                    Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          color: Colors.pink,
                        ),
                        const SizedBox(width: 3,),
                        const Text('Total Balance',style: TextStyle(fontSize: 15,color: Colors.pink),)
                      ],
                    )
                  ],
                )


              ],
            )
          ],
        ),
      );
    }
    if (widget.indexx == 2) {
      return Container(
        height: 340,
        width: double.infinity,
        child: PieChart(
          chartRadius: MediaQuery.of(context).size.width/1.1,
          dataMap: dataMapMonth,
          legendOptions: const LegendOptions(
              legendPosition: LegendPosition.bottom
          ),
          chartValuesOptions: const ChartValuesOptions(
              showChartValuesInPercentage: true
          ),
        ),
      );
    }
    else if (widget.indexx == 3) {
      return Container(
        height: 340,
        width: double.infinity,
        child: PieChart(
          chartRadius: MediaQuery.of(context).size.width/1.1,
          dataMap: dataMapYear,
          legendOptions: const LegendOptions(
              legendPosition: LegendPosition.bottom
          ),
          chartValuesOptions: const ChartValuesOptions(
              showChartValuesInPercentage: true
          ),
        ),
      );
    }
    else{
      return Container(
        height: 300,
        width: double.infinity,


      );
  }


  }
}

