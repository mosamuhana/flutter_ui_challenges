import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  double amount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _hbox20,
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    amount = double.parse(val);
                  });
                },
                decoration: InputDecoration(hintText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
            ),
            _hbox20,
            RaisedButton(
              onPressed: () {},
              child: Text('Pay', style: TextStyle(color: Colors.white)),
              color: Theme.of(context).primaryColor,
            ),
            Text(
              'Note: Make sure your device have khalti app',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  final _hbox20 = SizedBox(height: 20);
}
