import 'package:expense_tracker/pages/expense_detail.dart';
import 'package:expense_tracker/types/expense.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({Key? key, required this.expense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(18.0),
        child: Text(expense.description.toUpperCase()),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExpenseDetail(expense: expense),
            ));
      },
    );
  }
}
