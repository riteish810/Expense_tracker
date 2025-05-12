// ignore_for_file: unused_field

import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  Expense({super.key});
  final List<Expenses> _registeredexpense = [
    Expenses(
      DateTime: DateTime.now(),
      amount: 100,
      title: 'Fluttercourse',
      category: Category.food,
    ),
    Expenses(
      DateTime: DateTime.now(),
      amount: 10,
      title: 'cinema',
      category: Category.leisure,
    ),
    Expenses(
      DateTime: DateTime.now(),
      amount: 200,
      title: 'Food',
      category: Category.food,
    ),
  ];

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('The Expense Chart'),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
