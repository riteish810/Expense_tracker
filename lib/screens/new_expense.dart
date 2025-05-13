import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Scaffold(
        body: Column(
          children: [
            TextFormField(
              maxLength: 50,
              decoration: InputDecoration(label: Text('Title')),
            ),
            Row(children: [TextField()]),
            Row(children: [TextField()]),
            Row(children: [TextField()]),
          ],
        ),
      ),
    );
  }
}
