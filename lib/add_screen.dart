import 'package:flutter/material.dart';
import 'package:flutter_finance_app/data/add_data.dart';
import 'package:hive_flutter/hive_flutter.dart';
class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  final box = Hive.box<AddData>('data');
  DateTime date = DateTime.now();

  final explain = TextEditingController();
  final amount = TextEditingController();
  String? selectedItem;
  String? selectedItem2;
  final List _item = ["Food", "Transfer", "Transportation", 'Education'];
  final List _item2 = ['Income', 'Outcome'];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            backgroundContainer(context),
            Positioned(
              top: 120,
              child: mainContainer(),
            )
          ],
        ),
      ),
    );
  }

  Container mainContainer() {
    return Container(
      height: 550,
      width: 340,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          name(),
          const SizedBox(
            height: 30,
          ),
          Explain(),
          const SizedBox(
            height: 30,
          ),
          Amount(),
          const SizedBox(
            height: 30,
          ),
          How(),
          const SizedBox(
            height: 30,
          ),
          DateandTime(),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: (){
var add = AddData(selectedItem2, amount.text, date, explain.text, selectedItem);
box.add(add);
Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.teal
              ),
              width: 120,
              height: 50,
              child: const Text('Save',style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),),
            ),
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }

  Container DateandTime() {
    return Container(
          alignment: Alignment.bottomLeft,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2,color: Colors.grey),
          ),
          child: TextButton(
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030));

              if(newDate == null) return;
              setState(() {
                date = newDate;
              });
            },
            child: Text('Date: ${date.year} / ${date.month} / ${date.day}',style: const TextStyle(
              fontSize: 17,
              color: Colors.black
            ),),
          ),
        );
  }

  Container How() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.grey)),
      child: DropdownButton(
        value: selectedItem2,
        onChanged: (value) {
          setState(() {
            selectedItem2 = value as String?;
          });
        },
        items: _item2
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: Image.asset('asset/images/$e.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        e,
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ))
            .toList(),
        hint: const Text(
          'How',
          style: TextStyle(color: Colors.grey),
        ),
        isExpanded: true,
        dropdownColor: Colors.white,
        underline: Container(),
        selectedItemBuilder: (context) => _item2
            .map((e) => Row(
                  children: [
                    SizedBox(
                      width: 42,
                      child: Image.asset('asset/images/$e.png'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(e)
                  ],
                ))
            .toList(),
      ),
    );
  }

  Padding Amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: amount,
        decoration: InputDecoration(
            labelText: 'amount',
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.grey)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
      ),
    );
  }

  Padding Explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: explain,
        decoration: InputDecoration(
            labelText: 'explain',
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.grey)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
      ),
    );
  }

  Container name() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.grey)),
      child: DropdownButton(
        value: selectedItem,
        onChanged: (value) {
          setState(() {
            selectedItem = value as String?;
          });
        },
        items: _item
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: Image.asset('asset/images/$e.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        e,
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ))
            .toList(),
        hint: const Text(
          'Name',
          style: TextStyle(color: Colors.grey),
        ),
        isExpanded: true,
        dropdownColor: Colors.white,
        underline: Container(),
        selectedItemBuilder: (context) => _item
            .map((e) => Row(
                  children: [
                    SizedBox(
                      width: 42,
                      child: Image.asset('asset/images/$e.png'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(e)
                  ],
                ))
            .toList(),
      ),
    );
  }

  Column backgroundContainer(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    const Text(
                      'Adding',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const Icon(
                      Icons.attach_file,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
