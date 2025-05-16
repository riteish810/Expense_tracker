import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // var _enteredtitle = ' ';
  // void _savetitleinput(String inputvalue) {
  //   _enteredtitle = inputvalue;
  // }
  final _titlecontroller = TextEditingController();
  final _amoutcontroller = TextEditingController();
  DateTime? _selectedDate;
  @override
  void dispose() {
    _titlecontroller.dispose();
    _amoutcontroller.dispose();
    super.dispose();
  }

  void _presentdatepicker() async {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 2, now.month - 2, now.day - 2);
    final pickeddate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstdate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickeddate;
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            controller: _titlecontroller,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _amoutcontroller,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                    prefixText: '\$',
                    label: Text('Amount'),
                  ),
                ),
              ),
              // SizedBox(width: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Date Selected '
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _presentdatepicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_titlecontroller.text);
                  print(_amoutcontroller.text);
                },
                child: Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
