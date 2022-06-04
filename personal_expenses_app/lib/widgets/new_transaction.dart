// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _addTxCallBack;
  final titelInputControler = TextEditingController();
  final amountInputControler = TextEditingController();
  NewTransaction(this._addTxCallBack);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: const InputDecoration(label: Text('Title')),
            controller: titelInputControler,
          ),
          TextField(
            decoration: const InputDecoration(label: Text('Amount')),
            controller: amountInputControler,
          ),
          FlatButton(
            onPressed: () {
              _addTxCallBack(titelInputControler.text,
                  double.parse(amountInputControler.text));
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
