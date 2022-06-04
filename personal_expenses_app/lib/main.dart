import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

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
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.7, dateTime: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 99.2,
        dateTime: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fluter App')),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Card(
              color: Colors.blue,
              elevation: 5,
              child: SizedBox(
                width: double.infinity,
                child: Text('CHART!'),
              ),
            ),
            Column(
                children: transactions
                    .map((e) => Card(
                          child: Row(children: [
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.green, width: 1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4))),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              padding: const EdgeInsets.all(8),
                              child: Text('\$ ${e.amount}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green,
                                  )),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.title!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                                Text(DateFormat().format(e.dateTime!), style: const TextStyle(fontSize: 14,color: Colors.grey),),
                              ],
                            )
                          ]),
                        ))
                    .toList())
          ]),
    );
  }
}
