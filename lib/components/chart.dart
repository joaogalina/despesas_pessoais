import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum = 0.0;

      recentTransactions.forEach((element) {
        var sameDay = element.date.day == weekDay.day;
        var sameMonth = element.date.month == weekDay.month;
        var sameYear = element.date.year == weekDay.year;

        if(sameDay && sameMonth && sameYear ){
          totalSum += element.value;
        }
      });

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': 9.99,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          children: [],
        ));
  }
}
