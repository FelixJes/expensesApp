import '../models/transcation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TranscationList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    'No Transaction added yet',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/img/sleeping.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 6,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}'))),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? FlatButton.icon(
                          onPressed: () {
                             deleteTx(transactions[index].id);
                          },
                          icon: Icon(Icons.delete),
                          label: Text('Delete'),
                          textColor: Colors.red[700],)
                      : IconButton(
                          onPressed: () {
                            deleteTx(transactions[index].id);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red[700],
                          )),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
