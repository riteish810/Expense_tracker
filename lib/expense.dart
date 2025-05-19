import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/screens/expense_list.dart';
import 'package:expense_tracker/screens/new_expense.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key, required this.onAddExpense});
  final void Function(Expenses expense) onAddExpense;

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<Expenses> _registeredExpenses = [];

  void _addopenoverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addexpense),
    );
  }

  void _addexpense(Expenses expense) {
    // <-- use the correct model class
    setState(() {
      _registeredExpenses.add(expense);
    });
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
