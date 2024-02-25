import 'package:flutter/material.dart';
import 'package:flutter_finance_app/utility.dart';

import 'data/add_data.dart';
import 'data/chart_data.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  final List<String>dayy = [

    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"

  ];
  List day = ['Day', 'Week', 'Month', 'Year'];
  List f = [today(),week(),month(),year()];
  List<AddData> a = [];
  int index_color = 0;
  ValueNotifier kj = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: ValueListenableBuilder(
valueListenable: kj,
        builder: (context, dynamic value, child) {
  a = f[value];

          return custom();
        },
      ),
    ),);
  }

  CustomScrollView custom() {
    return CustomScrollView(

      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const Text('Statistics',style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20
              ),),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    ...List.generate(4, (index) {
                      return GestureDetector(

                        onTap: () {
                          setState(() {
                            index_color = index;
                            kj.value = index;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: index_color==index?Colors.teal.shade800:Colors.white
                          ),
                          alignment: Alignment.center,
                          child: Text('${day[index]}',style: TextStyle(
                              color: index_color==index?Colors.white:Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                        ),
                      );
                    })
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 2),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Expenses',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          ),),
                          Icon(Icons.arrow_downward_outlined)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),

             //Graph call this here
             Chart(indexx: index_color),


              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Top Spending',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),),

                    Icon(Icons.swap_vert,size: 25,color: Colors.grey,)
                  ],
                ),
              )
            ],
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate((context,index){

          return index < a.length ? ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('asset/images/${a[index].name}.png',height: 40,), // must modify this
            ),
            title: Text('${a[index].name}', style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
            ),),
            subtitle: Text(
              '${dayy[a[index].dateTime!.weekday-1]} ${a[index].dateTime?.year}-${a[index].dateTime?.month}-${a[index].dateTime?.day}', style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600
            ),
            ),
            trailing: Text(
              '\$${a[index].amount}', style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: a[index].IN == 'Income' ? Colors.green : Colors.red
            ),
            ),
          ) : Container();  // Return an empty container if index is out of bounds
          // Return an empty container if index is out of bounds

        },childCount: a.length
        ))
      ],

    );
  }
}
