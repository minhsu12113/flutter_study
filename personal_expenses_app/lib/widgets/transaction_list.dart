import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: ((context, index) => Card(
                child: Row(children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 1),
                        borderRadius: const BorderRadius.all(Radius.circular(4))),
                    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    padding: const EdgeInsets.all(8),
                    child: Text('\$ ${transactions[index].amount!.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.green,
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].title!,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        DateFormat().format(transactions[index].dateTime!),
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  )
                ]),
              ))),
    );
  }
}
