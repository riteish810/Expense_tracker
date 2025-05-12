import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

enum Category { food, travel, leisure, work }

class Expenses {
  Expenses({
    required this.amount,
    required this.title,
    required this.category,
    required this.date,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
