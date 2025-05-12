import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/screens/expense_list.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<Expenses> _registeredExpenses = [
    Expenses(
      date: DateTime.now(),
      amount: 100,
      title: 'Flutter course',
      category: Category.food,
    ),
    Expenses(
      date: DateTime.now(),
      amount: 10,
      title: 'Cinema',
      category: Category.leisure,
    ),
    Expenses(
      date: DateTime.now(),
      amount: 200,
      title: 'Food',
      category: Category.food,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense Tracker')),
      body: Column(
        children: [
          const Text('The Expense Chart'),
          Expanded(child: ExpenseList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
