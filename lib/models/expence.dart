


import 'package:uuid/uuid.dart';

//create a unique id using uuid
dynamic uuid = const Uuid().v4();

enum Category{food,travel,leasure,work}

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
}