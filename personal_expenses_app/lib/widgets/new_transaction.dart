// ignore_for_file: deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTxCallBack;

  NewTransaction(this.addTxCallBack);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInputController = TextEditingController();
  final _amountInputController = TextEditingController();
  DateTime? _selectedDate;

  void _submitdata() {
    if (_titleInputController.text.isEmpty ||
        _amountInputController.text.isEmpty || _selectedDate == null) {
      return;
    }
    final enteredTitle = _titleInputController.text;
    final enteredAmount = double.parse(_amountInputController.text);
    widget.addTxCallBack(enteredTitle, enteredAmount,_selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SingleChildScrollView(
        child: Container(
          padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom) ,
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(label: Text('Title')),
                controller: _titleInputController,
                onSubmitted: (val) => _submitdata(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  decoration: const InputDecoration(label: Text('Amount')),
                  controller: _amountInputController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (val) => _submitdata()),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}'),
                  ),
                  FlatButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Chose Date!',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            FlatButton(
              onPressed: () {
                _submitdata();
                FocusScope.of(context).unfocus();
              },
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: const Text('Add Trantractions'),
            )
          ]),
        ),
      ),
    );
  }
}
