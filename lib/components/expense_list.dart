import 'dart:convert';
import 'dart:developer';

import 'package:expense_tracker/components/expense_card.dart';
import 'package:expense_tracker/types/expense.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

Future<List<Expense>> fetchExpense() async {
  final response =
      await http.get(Uri.parse("http://192.168.0.193:8000/api/v1/expense"));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Expense.fromJson(data)).toList();
  } else {
    log('Data failed to load');
    throw Exception('Failed to load');
  }
}

class _ExpenseListState extends State<ExpenseList> {
  late Future<List<Expense>> expenses;

  @override
  void initState() {
    super.initState();
    expenses = fetchExpense();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: FutureBuilder<List<Expense>>(
          future: fetchExpense(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Expense>? expense = snapshot.data;
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      ExpenseCard(
                          expense: Expense(
                              id: expense![index].id,
                              description: expense[index].description,
                              userId: expense[index].userId,
                              amount: expense[index].amount,
                              createdAt: expense[index].createdAt))
                    ],
                  );
                },
                itemCount: expense?.length,
              );
              // return const Text('No data 1');
            } else if (snapshot.hasError) {
              return const Text('Data errro');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        onRefresh: () {
          setState(() {});
          return fetchExpense();
        });
  }
}
