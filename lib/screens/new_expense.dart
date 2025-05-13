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
  @override
  void dispose() {
    _titlecontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            // onChanged: _savetitleinput,
            // onChanged: titlecontroller,
            controller: _titlecontroller,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_titlecontroller.text);
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
