import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_app/utility.dart';
import 'package:flutter_finance_app/utility_week.dart';
class LinearChartWeek extends StatelessWidget {


   LinearChartWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      duration: const Duration(milliseconds: 200),
        sampleData1
    );
  }
}
LineChartData get sampleData1 => LineChartData(
    gridData: gridData,
    titlesData: titleData,
    borderData: borderData,
    lineBarsData: linearbarData,
    minX: 0,
    maxX: 8,
    minY: 0,
    maxY: maxYFind()[1].toDouble()
);
List<LineChartBarData> get linearbarData=>[
  lineChartBarData1,
  lineChartBarData2,
  lineChartBarData3,
];

FlTitlesData get titleData => FlTitlesData(
    bottomTitles: AxisTitles(
        sideTitles: bottomTitles
    ),
    rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false)
    ),
    topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false)
    ),
    leftTitles: AxisTitles(
        sideTitles: leftTitles()
    )
);

Widget leftTitlesWidget(double value, TitleMeta meta){
  int minV = maxYFind()[0];
  int maxV = maxYFind()[1];
  int interval = maxYFind()[2];
  const style=TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.grey
  );
  String text;
  if(value.toInt()==minV){
  text = minV.toString();
}
else if(value.toInt() == (minV+interval))
  {
    text = (minV+interval).toString();
  }
else if(value.toInt() == (minV+2*interval))
{
  text = (minV+2*interval).toString();
}
else if(value.toInt() == (minV+3*interval))
{
  text = (minV+3*interval).toString();
}
else if(value.toInt() == (minV+4*interval))
{
  text = (minV+4*interval).toString();
}
  else if(value.toInt() == (minV+5*interval))
  {
    text = (minV+5*interval).toString();
  }
else{
  return Container();
}

  return Text(text,style: style,textAlign: TextAlign.center,);
}

SideTitles leftTitles(){
  return const SideTitles(
      showTitles: true,
      getTitlesWidget: leftTitlesWidget,
      interval: 1,
      reservedSize: 44
  );
}

Widget bottomTitleWidget(double value, TitleMeta meta){
  const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.grey
  );
  Widget text;
  switch(value.toInt())
  { // agulor range 0-14 er majhe hobe karon agei define kora hoyese minY and maxY
    case 1:
      text= const Text('Mon',style: style,);
      break;
    case 2:
      text= const Text('Tue',style: style,);
      break;
    case 3:
      text= const Text('Wed',style: style,);
      break;
    case 4:
      text= const Text('Thu',style: style,);
      break;
    case 5:
      text= const Text('Fri',style: style,);
      break;
    case 6:
      text= const Text('Sat',style: style,);
      break;
    case 7:
      text= const Text('Sun',style: style,);
      break;
    default:
      text = const Text('');
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}

SideTitles get bottomTitles=> const SideTitles(
    reservedSize: 32,
    interval: 1,
    showTitles: true,
    getTitlesWidget: bottomTitleWidget
);

FlGridData get gridData=> const FlGridData(show: true);

FlBorderData get borderData=> FlBorderData(
    show: true,
    border: const Border(
        bottom: BorderSide(width: 4,color: Colors.grey),
        left: BorderSide(color: Colors.grey),
        top: BorderSide(color: Colors.transparent),
        right: BorderSide(color: Colors.transparent)
    )
);

LineChartBarData get lineChartBarData1 => LineChartBarData(
    isCurved: true,
    color: Colors.indigo,
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: true),
    belowBarData: BarAreaData(show: false),
    spots: [
      FlSpot(1, Mon()[0].toDouble()),
      FlSpot(2, Tue()[0].toDouble()),
      FlSpot(3, Wed()[0].toDouble()),
      FlSpot(4, Thu()[0].toDouble()),
      FlSpot(5, Fri()[0].toDouble()),
      FlSpot(6, Sat()[0].toDouble()),
      FlSpot(7, Sun()[0].toDouble()),
    ]
);

LineChartBarData get lineChartBarData2 => LineChartBarData(
    isCurved: true,
    color: Colors.green,
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: true),
    belowBarData: BarAreaData(show: false),
    spots: [
      FlSpot(1, Mon()[1].toDouble()),
      FlSpot(2, Tue()[1].toDouble()),
      FlSpot(3, Wed()[1].toDouble()),
      FlSpot(4, Thu()[1].toDouble()),
      FlSpot(5, Fri()[1].toDouble()),
      FlSpot(6, Sat()[1].toDouble()),
      FlSpot(7, Sun()[1].toDouble()),
    ]
);

LineChartBarData get lineChartBarData3 => LineChartBarData(
    isCurved: true,
    color: Colors.pink,
    barWidth: 3,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: true),
    belowBarData: BarAreaData(show: false),
    spots: [
      FlSpot(1, Mon()[2].toDouble()),
      FlSpot(2, Tue()[2].toDouble()),
      FlSpot(3, Wed()[2].toDouble()),
      FlSpot(4, Thu()[2].toDouble()),
      FlSpot(5, Fri()[2].toDouble()),
      FlSpot(6, Sat()[2].toDouble()),
      FlSpot(7, Sun()[2].toDouble()),
    ]
);

