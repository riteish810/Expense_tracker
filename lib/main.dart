import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorscheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 151),
);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorscheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorscheme.primaryContainer,
          foregroundColor: kColorscheme.primaryContainer,
        ),
        scaffoldBackgroundColor: Colors.purple[200]!,
      ),
      home: const Expenses(),
    ),
  );
}
