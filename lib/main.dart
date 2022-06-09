import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Personal Expense",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 1500,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "New Watch",
      amount: 1000,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("CHART !!"),
              elevation: 5.0,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      right: 8.0,
                    ),
                    child: ElevatedButton(onPressed: () {}, child: Text("Add")),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map(
              (tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "₹ ${tx.amount}",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat.yMMMd().format(tx.date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
