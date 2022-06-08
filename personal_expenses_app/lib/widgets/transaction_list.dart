import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Transaction added yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                    height: 200,
                    padding: EdgeInsets.all(16),
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: ((context, index) => Container(
                    margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              child: Text(
                                  '\$ ${transactions[index].amount!.toStringAsFixed(2)}'),
                            ),
                          ),
                        ),
                        title: Text(transactions[index].title!, style: Theme.of(context).textTheme.titleMedium,),
                        subtitle: Text(DateFormat().format(transactions[index].date!),
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                      ),
                    ),
                  ))),
    );
  }
}
