import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/widgets/expenses.dart'; // Not main.dart anymore

void main() {
  testWidgets('Basic widget test for Expenses', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Expenses()));

    // Example: Check for app bar title
    expect(find.text('Flutter ExpenseTracker'), findsOneWidget);
  });
}
