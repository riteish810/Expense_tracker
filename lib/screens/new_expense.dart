import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expenses expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titlecontroller = TextEditingController();
  final _amoutcontroller = TextEditingController();
  Category _selectedCategory = Category.food;

  DateTime? _selectedDate;

  @override
  void dispose() {
    _titlecontroller.dispose();
    _amoutcontroller.dispose();
    super.dispose();
  }

  void _presentdatepicker() async {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 2, now.month, now.day);
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

  void _submitExpensedata() {
    final enterednumber = double.tryParse(_amoutcontroller.text);
    final amountIsInvalid = enterednumber == null || enterednumber <= 0;

    if (_titlecontroller.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: Text('Invalid Input'),
              content: Text(
                'Please make sure title, amount, and date are valid.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Okay'),
                ),
              ],
            ),
      );
      return;
    }

    widget.onAddExpense(
      Expenses(
        title: _titlecontroller.text,
        amount: enterednumber,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );

    Navigator.pop(context); // Close the modal after adding
  }

  @override
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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Date Selected'
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
              DropdownButton<Category>(
                value: _selectedCategory,
                items:
                    Category.values.map((category) {
                      return DropdownMenuItem<Category>(
                        value: category,
                        child: Text(
                          category.name[0].toUpperCase() +
                              category.name.substring(1),
                        ),
                      );
                    }).toList(),
                onChanged: (Category? newValue) {
                  if (newValue == null) return;
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submitExpensedata,
                child: Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
