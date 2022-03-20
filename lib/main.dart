// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:expense_tracker/components/random_words.dart';
import 'package:expense_tracker/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
          title: 'Welcome to Flutter',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const Dashboard());
    });
  }
}
