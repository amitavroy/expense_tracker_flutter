import 'package:expense_tracker/types/expense.dart';
import 'package:flutter/material.dart';

class ExpenseDetail extends StatelessWidget {
  final Expense expense;
  const ExpenseDetail({Key? key, required this.expense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(expense.description)),
      body: Center(
        child: Text(expense.description),
      ),
    );
  }
}
