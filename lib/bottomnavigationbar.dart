import 'package:flutter/material.dart';
import 'package:flutter_finance_app/statistics.dart';

import 'add_screen.dart';
import 'home_page.dart';
class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index_color=0;
  List screen = [ const HomePage(), const Statistics()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: screen[index_color],
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.pink,onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const Add_Screen()));
      },child: const Icon(Icons.add,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5,bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: (){
setState(() {
  index_color = 0;
});
                  },
                  child: Icon(Icons.home,size: 30,
                    color: index_color==0? Colors.pink:Colors.grey,)),
              GestureDetector(
                  onTap: (){
                    setState(() {
                      index_color = 1;
                    });
                  },
                  child: Icon(Icons.bar_chart,size: 30,color: index_color==1? Colors.pink:Colors.grey)),
              // const SizedBox(width: 20,),
              // GestureDetector(
              //     onTap: (){
              //       setState(() {
              //         index_color = 2;
              //       });
              //     },
              //     child: Icon(Icons.account_balance_wallet,size: 30,color: index_color==2? Colors.pink:Colors.grey)),
              // GestureDetector(
              //     onTap: (){
              //       setState(() {
              //         index_color = 3;
              //       });
              //     },
              //     child: Icon(Icons.person_outline,size: 30,color: index_color==3? Colors.pink:Colors.grey))
            ],
          ),
        ),
      ),
    ));
  }
}
