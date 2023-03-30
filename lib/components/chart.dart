import 'package:despesas_pessoais/components/chart_bar.dart';
import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum = 0.0;

      recentTransactions.forEach((element) {
        var sameDay = element.date.day == weekDay.day;
        var sameMonth = element.date.month == weekDay.month;
        var sameYear = element.date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += element.value;
        }
      });

      return {
        'day': DateFormat.E().format(weekDay).substring(0,3),
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, element) {
      return sum + (element['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions.map((t) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: t['day'].toString(),
                  value: t['value'] as double,
                  percentage: _weekTotalValue == 0.0 ? 0.0 : (t['value'] as double) / _weekTotalValue,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
