import 'package:flutter/material.dart';
import 'package:flutter_finance_app/utility.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/add_data.dart';



class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  var history;

  final box = Hive.box<AddData>('data');

  final List<String>day = [

    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"

  ];


  @override
  Widget build(BuildContext context) {
   return SafeArea(
        child: Scaffold(
            body: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, value, child){
return CustomScrollView(
  slivers: [
    SliverToBoxAdapter(
      child: SizedBox(height: 340,child: _head()),
    ),
    const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Transaction History',style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
              ),),
              Text('See all',style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
              ),)
            ],
          ),
        )
    ),
    SliverList(delegate: SliverChildBuilderDelegate(

            (context,index){
          history = box.values.toList()[index];
          return getList(history, index);

        },childCount: box.length

    ))

  ],
);
              },

            )
        ));
  }

  Widget getList(AddData history, int index)
  {
    return Dismissible(key: UniqueKey(),
        onDismissed: (direction){
      history.delete();
        },
        child: buildListTile(index, history));
  }

  ListTile buildListTile(int index, AddData history) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(15),

        child: Image.asset('asset/images/${history.name}.png',height: 40,), // must modify this
      ),
      title: Text('${history.name}',style:  const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold
      ),),
      subtitle: Text(
        '${day[history.dateTime!.weekday-1]} ${history.dateTime?.year}-${history.dateTime?.month}-${history.dateTime?.day}',style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600
      ),
      ),
      trailing: Text(
        '\$${history.amount}',style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600,
          color: history.IN == 'Income' ?Colors.green:Colors.red
      ),
      ),
    );
  }
}

Widget _head()
{
  return Stack(
    children: [
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Stack(
              children: [
                Positioned(
                    top: 35,
                    right: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        height: 40,
                        width: 40,
                        color: Colors.teal.shade600,
                        child: const Icon(
                          Icons.notification_add_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    )),
                 Padding(
                  padding: const EdgeInsets.only(top: 35, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( '${typeTime()}',
                          style: const TextStyle(
                              color: Colors.yellowAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      const Text('Welcome to our app', // put here user name Md. Jakaria Ibna Azam Khan
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      Positioned(
        top: 140,
        left: 25,
        right: 25,
        child: Container(
          height: 170,
          width: 320,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.teal,
                    blurRadius: 12,
                    spreadRadius: 6,
                    offset: Offset(0,6)

                )
              ],
              color: Colors.teal.shade800,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Column(

            children: [
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Balance',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                    Icon(Icons.more_horiz,color: Colors.white,)
                  ],
                ),
              ),
              const SizedBox(height: 7,),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text('\$ ${total()}',style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),)
                  ],
                ),
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundColor: Colors.teal.shade400,
                          child: const Icon(Icons.arrow_downward_outlined,size: 19,color: Colors.white,),
                        ),
                        const SizedBox(width: 7,),
                        const Text('Income',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundColor: Colors.teal.shade400,
                          child: const Icon(Icons.arrow_upward_outlined,size: 19,color: Colors.white,),
                        ),
                        const SizedBox(width: 7,),
                        const Text('Expenses',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ))
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$ ${income()}',style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    )),
                    Text('\$ ${expenses()}',style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}