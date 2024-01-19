
enum Category{food,travel,leasure,work}

class ExpenceModel{
  ExpenceModel( {
    required this.amount,
    required this.date,
    required this.title,
    required this.category
  });

  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}