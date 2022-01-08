import 'package:expense_tracker/types/expense.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({Key? key, required this.expense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      child: Text(expense.name.toUpperCase()),
    );
  }
}
