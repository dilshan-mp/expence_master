//import 'dart:ffi';

import 'package:expence_master/models/expence.dart';
import 'package:flutter/material.dart';
//import 'package:expence_master/models/expence.dart';

//import '../models/expence.dart';

class AddNewExpences extends StatefulWidget {
  const AddNewExpences({super.key});

  @override
  State<AddNewExpences> createState() => _AddNewExpencesState();
}

class _AddNewExpencesState extends State<AddNewExpences> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.leasure;
  @override

  /*title walata wen wela thiynawa space eka in krnawa stete ek ain wenakota*/ 
  void dispose(){
    super.dispose();
    _titleController.dispose();
    _amountController:dispose();
  }

  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller:_titleController,
            decoration: const InputDecoration(
              hintText: "Add new expences title",
              label: Text("Title",style:TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 25) ,),
            ),
            keyboardType: TextInputType.text,
          ),
          Row(
            children: [
              //amount
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    helperText: "Enter the amount",
                    label: Text("Amount")
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("2023/2/2"),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.date_range_outlined),
                    )
                  ],
                ) ,
              ), 
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items:Category.values.map((Category) => DropdownMenuItem(
                  value: Category ,
                  child: Text(Category.name),
                  ),
                  ).toList() ,
                 onChanged: (value){
                  setState(() {
                    _selectedCategory = value!;
                  });
                  
                 }
                ),
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: (){},
                       style: const ButtonStyle(
                        backgroundColor:MaterialStatePropertyAll(Colors.redAccent),
                        ),
                       child: const Text("Close"),
                      ),
                      const SizedBox(width: 10,),
                    ElevatedButton(
                      onPressed: (){},
                       style: const ButtonStyle(
                        backgroundColor:MaterialStatePropertyAll(Colors.greenAccent)
                        ),
                       child: const Text("Save"),
                       )
                  ],
                ))
            ],
          )
        ],
      ),
    );
  }
}