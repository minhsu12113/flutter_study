// ignore_for_file: deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTxCallBack;

  NewTransaction(this.addTxCallBack);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputController = TextEditingController();

  final amountInputController = TextEditingController();

  void submitdata() {
    if (titleInputController.text.isEmpty ||
        amountInputController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleInputController.text;
    final enteredAmount = double.parse(amountInputController.text);
    widget.addTxCallBack(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
    //FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: const InputDecoration(label: Text('Title')),
            controller: titleInputController,
            onSubmitted: (val) => submitdata(),
          ),
          TextField(
            decoration: const InputDecoration(label: Text('Amount')),
            controller: amountInputController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (val) => submitdata(),
            maxLength: 24,
          ),
          FlatButton(
            onPressed: () {
              submitdata();
              FocusScope.of(context).unfocus();
            },
            textColor: Colors.green,
            child: const Text('Add Trantractions'),
          )
        ]),
      ),
    );
  }
}
