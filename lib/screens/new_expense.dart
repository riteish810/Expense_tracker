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
  Category _selectedCategory = Category.food; // default value

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

  void _submitExpensedata() {
    final enterednumber = double.tryParse(
      _amoutcontroller.text,
    ); //tryparse ('Hello')=> null, tryparse ('1.12')=>1.12
    final amountIsInvalid = enterednumber == null || enterednumber <= 0;
    if (_titlecontroller.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      //Show error message
      showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: Text('Invalid Input'),
              content: Text(
                'Please make sure Entered title , Amount , Date and Category is valid',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); //as builder given ctx value
                  },
                  child: Text('Okay'),
                ),
              ],
            ),
      );
      return;
    }
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
