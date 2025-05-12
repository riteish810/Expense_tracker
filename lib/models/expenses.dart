import 'package:uuid/uuid.dart';

//uuid here used to generate new and unique id
final uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
} // predefined values // Nota string

class Expenses {
  Expenses({
    required this.DateTime,
    required this.amount,
    required this.title,
    // required this.Category,
    required this.category,
  }) : id = uuid.v4();
  final String title;
  final double amount;
  final String id;
  final DateTime;
  final Category category;

  // ignore: non_constant_identifier_names
  // string here can accept any sting value even though there is a typo error therefore used a string
}
