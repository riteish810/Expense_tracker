import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/rendering.dart';

var kColorscheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 151),
);

var kdarkcolorscheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125),
);
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kdarkcolorscheme,
        cardTheme: CardTheme().copyWith(
          color: kdarkcolorscheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kdarkcolorscheme.primaryContainer,
            foregroundColor: kdarkcolorscheme.onPrimaryContainer,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        // ignore: deprecated_member_use
        useMaterial3: true,
        colorScheme: kColorscheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorscheme.onPrimaryContainer,
          foregroundColor: kColorscheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorscheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorscheme.primaryContainer,
          ),
        ),
        // textTheme: Theme.of(context).copyWith(),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: kColorscheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
      ),
      themeMode: ThemeMode.system,

      //  final textTheme = Theme.of(context).textTheme;
      home: const Expenses(),
    ),
  );
}
