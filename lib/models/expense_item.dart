import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:expense_tracker/expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expenses expenses; // <-- fixed type name

  const ExpenseItem({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: Column(
          children: [
            Text(
              expenses.title, // <-- works now
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '\$${expenses.amount.toStringAsFixed(2)}', // <-- works now
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryicons[expenses.category]),
                    SizedBox(height: 10),
                    Text(expenses.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
