// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _addTxCallBack;
  final titelInputControler = TextEditingController();
  final amountInputControler = TextEditingController();
  NewTransaction(this._addTxCallBack);

  void submitdata() {
    if (amountInputControler.text.isEmpty || amountInputControler.text.isEmpty) {
      return;
    }
    final enteredTitel = titelInputControler.text;
    final enteredAmount = double.parse(amountInputControler.text);
    _addTxCallBack(enteredTitel, enteredAmount);

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
            controller: titelInputControler,
            onSubmitted: (val) => submitdata(),
          ),
          TextField(
            decoration: const InputDecoration(label: Text('Amount')),
            controller: amountInputControler,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (val) => submitdata(),
            maxLength: 4,
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
