import 'dart:convert';

import 'package:expense_tracker/pages/expenses.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExpenseAddForm extends StatefulWidget {
  const ExpenseAddForm({Key? key}) : super(key: key);

  @override
  _ExpenseAddFormState createState() => _ExpenseAddFormState();
}

class _ExpenseAddFormState extends State<ExpenseAddForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {'description': null, 'amount': 0};

  saveExpense(Map<String, dynamic> data) async {
    await http.post(Uri.parse('http://192.168.0.193:8000/api/v1/expense'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Expenses()));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Description'),
              onSaved: (value) {
                formData['description'] = value;
              },
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? 'Please enter text'
                    : null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
              onSaved: (value) {
                formData['amount'] = value;
              },
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? 'Please enter text'
                    : null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  saveExpense(formData);
                }
              },
              child: const Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}
