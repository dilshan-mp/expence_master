import 'package:expence_master/models/expence.dart';
import 'package:flutter/material.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expences> {
  final List <ExpenceModel> _expenceList = [
    ExpenceModel(
      amount: 12.5,
       date: DateTime.now(),
        title: "food",
         category: Category.leasure
         ),
    ExpenceModel(
      amount: 15.5,
       date: DateTime.now(),
        title: "travel",
         category: Category.food
         ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expence Master",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        actions: [
          Container(
            color: Colors.yellow,
            child: IconButton(
              onPressed: (){},
               icon: const Icon(Icons.add,color: Colors.black,),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _expenceList.length,
              itemBuilder: (context,index){
              return Text(_expenceList[index].title);
            }),
          ),
        ],
      ),
    );
  }
}