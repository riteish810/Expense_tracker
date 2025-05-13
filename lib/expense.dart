import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/screens/expense_list.dart';
import 'package:expense_tracker/screens/new_expense.dart';
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

  void _addopenoverlay() {
    showModalBottomSheet(context: context, builder: (ctx) => NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: _addopenoverlay),
        ],
        title: Text('Peronal Expense tracker'),
      ),
      body: Column(
        children: [
          const Text('The Expense Chart'),
          Expanded(child: ExpenseList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
