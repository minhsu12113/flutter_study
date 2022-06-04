// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/user_transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fluter App')),
      body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          width: double.infinity,
          child: const Card(
            color: Colors.blue,
            elevation: 5,
            child: SizedBox(
              width: double.infinity,
              child: Text('CHART!'),
            ),
          ),
        ),
        const UserTransaction()
      ])),
    );
  }
}
