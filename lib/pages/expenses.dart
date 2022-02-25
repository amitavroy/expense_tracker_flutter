import 'package:expense_tracker/components/expense_list.dart';
import 'package:expense_tracker/pages/add_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesWidgetState();
}

class _ExpensesWidgetState extends State<Expenses> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My expenses')),
      body: const Center(
        child: ExpenseList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Expenses'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'More'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddExpense()));
        },
        tooltip: 'Increment counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
