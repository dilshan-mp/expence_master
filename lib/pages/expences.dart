import 'package:expence_master/models/expence.dart';
import 'package:expence_master/widgets/add_new_expences.dart';
import 'package:expence_master/widgets/expence_list.dart';
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
  //Add new expence
  void onAddNewExpence(ExpenceModel expence){
    setState(() {
      _expenceList.add(expence);
    });
    
  }

  //remove a expence
  void onDeleteExpence(ExpenceModel expence){
    setState(() {
      _expenceList.remove(expence);
    });
  }

  //function to open a model overlay
  void _openAddExpencesOverlay(){
    showModalBottomSheet(context: context, builder:(context) {
      return  AddNewExpences(onAddExpence:onAddNewExpence ,);
    },
   );
  }




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
              onPressed:_openAddExpencesOverlay,
               icon: const Icon(Icons.add,color: Colors.black,),
            ),
          )
        ],
      ),
      body:  Column(
        children: [
          ExpenceList(expenceList: _expenceList,onDeleteExpence: onDeleteExpence,)
        ],
      ),
    );
  }
}