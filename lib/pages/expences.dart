import 'package:expence_master/models/expence.dart';
import 'package:expence_master/widgets/add_new_expences.dart';
import 'package:expence_master/widgets/expence_list.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
   Map<String, double> dataMap = {
    "Food": 0,
    "Travel": 0,
    "Leasure": 0,
    "Work": 0,
  };
  //Add new expence
  void onAddNewExpence(ExpenceModel expence){
    setState(() {
      _expenceList.add(expence);
       calCategoryValues();
    });
    
  }

  //

  //remove a expence
  void onDeleteExpence(ExpenceModel expence){

    //store the deleting expence
    ExpenceModel deletingExpence = expence;
    //get the index of the removing expence
    final int removingindex = _expenceList.indexOf(expence);
    setState(() {
      _expenceList.remove(expence);
      calCategoryValues();
    });

    //show snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: const Text("Delete Sucessfull"),
      action: SnackBarAction(
        label: "undo", 
        onPressed: (){
          setState(() {
            _expenceList.insert(removingindex,deletingExpence);
             calCategoryValues();
          });
        }),
      )
    );
  }

  //PIE CHART
  double foodVal = 0;
  double travelVal = 0;
  double leasureVal = 0;
  double workVal = 0;
  void calCategoryValues(){
      double foodValTotal = 0;
      double travelValTotal = 0;
      double leasureValTotal = 0;
      double workValTotal = 0;

      for (final expence in _expenceList) {
        if (expence.category == Category.food) {
          foodValTotal = expence.amount;
        }
        if (expence.category == Category.leasure) {
          leasureValTotal = expence.amount;
        }
        if (expence.category == Category.travel) {
          travelValTotal = expence.amount;
        }
        if (expence.category == Category.work) {
           workValTotal = expence.amount;
        }
      }

      setState(() {
        foodVal = foodValTotal;
        travelVal = travelValTotal;
        leasureVal = leasureValTotal;
        workVal = workValTotal;
      }); 

      //update the dataMap
         dataMap = {
            "Food": foodVal,
            "Travel": travelVal,
            "Leasure": leasureVal,
            "Work": workVal,
      };
  }
 

  //function to open a model overlay
  void _openAddExpencesOverlay(){
    showModalBottomSheet(context: context, builder:(context) {
      return  AddNewExpences(onAddExpence:onAddNewExpence ,);
    },
   );
  }


@override

void initState(){
  super.initState();
  calCategoryValues();
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
          PieChart(dataMap: dataMap,),
          ExpenceList(expenceList: _expenceList,onDeleteExpence: onDeleteExpence,)
        ],
      ),
    );
  }
}