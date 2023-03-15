import 'dart:ffi';

import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed:() {this.onSubmit(titleController.text, double.tryParse(valueController.text) ?? 0.0);},
                  child: Text('Nova Transação'),
                  style: TextButton.styleFrom(foregroundColor: Colors.green),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
