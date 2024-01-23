

// ignore: avoid_web_libraries_in_flutter
//import 'dart:js';

import 'package:expence_master/models/expence.dart';
import 'package:flutter/material.dart';

class AddNewExpences extends StatefulWidget {

 final void Function(ExpenceModel expence) onAddExpence;
  const AddNewExpences({super.key,required this.onAddExpence});

  @override
  State<AddNewExpences> createState() => _AddNewExpencesState();
}

class _AddNewExpencesState extends State<AddNewExpences> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.leasure;
  //date variable
  final DateTime initialDate = DateTime.now();
  final DateTime firstDate = DateTime(DateTime.now().year-1,DateTime.now().month,DateTime.now().day);
  final DateTime lastDate = DateTime(DateTime.now().year+1,DateTime.now().month,DateTime.now().day);

  DateTime _selectedDate = DateTime.now();
//date picker
Future <void> _openDateModal()async{
  try{
    //show the date model then store the user selected date
   final pickDate = await showDatePicker(
      context: context,
       firstDate: firstDate,
        lastDate: lastDate
      );
      setState(() {
        _selectedDate = pickDate!;
      });

  }catch(err){
    // ignore: avoid_print
    print(err.toString());
  }
}

void _handleFormSubmit(){
  //form validtion
  //conver the amount in to the dounle
  final userAmount = double.parse(_amountController.text.trim()) ;
  // ignore: unnecessary_null_comparison
  if (_titleController.text.trim().isEmpty || userAmount ==0) {
    showDialog(
      context: context,
      builder: (context){
        return(AlertDialog(
          title: const Text("Enter valid Data"),
          content: const Text("please enter valid data for the title and amount her the title cant be empty and the amount cant be less than zero") ,
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('close'),
              onPressed: () {
                Navigator.of(context).pop();//back wena eka wenne
              },
            ),
          ],
          )
        );
      }
    );
 }else{
  //create the new expence
  ExpenceModel newExpence = ExpenceModel(amount: userAmount, date:_selectedDate, title: _titleController.text.trim(), category: _selectedCategory);
  //save the data
  widget.onAddExpence(newExpence);
  Navigator.pop(context);
 }
}

  @override

  /*title walata wen wela thiynawa space eka in krnawa stete ek ain wenakota*/ 
  // void dispose(){
  //  super.dispose();
  //   _titleController.dispose();
  //   _amountController:dispose();
  // }

  @override
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
                    Text(fomattedData.format(_selectedDate)),
                    IconButton(
                      onPressed: (){
                        _openDateModal();
                      },
                      icon: const Icon(Icons.date_range_outlined),
                    )
                  ],
                ) ,
              ), 
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                // ignore: non_constant_identifier_names
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
                      onPressed: (){
                        Navigator.pop(context);
                      },
                       style: const ButtonStyle(
                        backgroundColor:MaterialStatePropertyAll(Colors.redAccent),
                        ),
                       child: const Text("Close"),
                      ),
                      const SizedBox(width: 10,),
                    ElevatedButton(
                      onPressed: _handleFormSubmit,
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