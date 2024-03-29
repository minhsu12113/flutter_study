// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/chart.dart';
import 'package:personal_expenses_app/widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import 'models/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  titleMedium: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [];

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date!.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date);

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        isScrollControlled: true,
        builder: (_) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            child:NewTransaction(_addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _recentTransactions.isEmpty
            ? const SizedBox(
                height: 8,
              )
            : Chart(_recentTransactions),
        TransactionList(_userTransaction)
      ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
