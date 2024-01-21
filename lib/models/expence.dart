


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

//create a unique id using uuid
dynamic uuid = const Uuid().v4();

//date formate
final fomattedData = DateFormat.yMd();


//enu for category
enum Category{food,travel,leasure,work}

// ignore: non_constant_identifier_names
final CategoryIcons = {
  Category.food : Icons.lunch_dining,
  Category.travel : Icons.travel_explore,
  Category.leasure : Icons.leak_add,
  Category.work : Icons.work

};

//constructor 
class ExpenceModel{
  ExpenceModel( {
    required this.amount,
    required this.date,
    required this.title,
    required this.category
  })
  :id = uuid;

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;


  //getter >formatter date

  String get getFormatedData{
    return fomattedData.format(date);
  }
}