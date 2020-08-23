import 'package:flutter/material.dart';

import 'beautiful_alert_dialog.dart';
import 'custom_alert_dialog.dart';
import 'payment_success_dialog.dart';

class AlertDialogsPage extends StatelessWidget {
  static final String path = "lib/src/pages/dialogs/alert_dialogs/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialogs'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            RaisedButton(
              color: Colors.lightGreen,
              colorBrightness: Brightness.light,
              child: Text("Alert Info Dialog"),
              onPressed: () async {
                var res = await _alertInfoDialog(context);
                print('Alert Info Dialog Result: $res');
              },
            ),
            RaisedButton(
              color: Colors.lightGreen,
              colorBrightness: Brightness.light,
              child: Text("Alert Warning Dialog"),
              onPressed: () async {
                var res = await _alertWarningDialog(context);
                print('Alert Warning Dialog Result: $res');
              },
            ),
            RaisedButton(
              color: Colors.lightGreen,
              colorBrightness: Brightness.light,
              child: Text("Alert Error Dialog"),
              onPressed: () async {
                var res = await _alertErrorDialog(context);
                print('Alert Error Dialog Result: $res');
              },
            ),
            RaisedButton(
              color: Colors.lightGreen,
              colorBrightness: Brightness.light,
              child: Text("Alert Question Dialog"),
              onPressed: () async {
                var res = await _alertQuestionDialog(context);
                print('Alert Question Dialog Result: $res');
              },
            ),
            // END ALERTs

            RaisedButton(
              color: Colors.lightGreen,
              colorBrightness: Brightness.light,
              child: Text("Payment Success"),
              onPressed: () => _paymentSuccessDialog(context),
            ),
            RaisedButton(
              color: Colors.lightGreen,
              colorBrightness: Brightness.light,
              child: Text("Success Dialog"),
              onPressed: () => _customAlertDialog(context, AlertDialogType.SUCCESS),
            ),
            RaisedButton(
              color: Colors.lightGreen,
              colorBrightness: Brightness.light,
              child: Text("Info Dialog"),
              onPressed: () => _customAlertDialog(context, AlertDialogType.INFO),
            ),
            RaisedButton(
              color: Colors.lightGreen,
              colorBrightness: Brightness.light,
              child: Text("Warning Dialog"),
              onPressed: () => _customAlertDialog(context, AlertDialogType.WARNING),
            ),
            RaisedButton(
              color: Colors.lightGreen,
              colorBrightness: Brightness.light,
              child: Text("Error Dialog"),
              onPressed: () => _customAlertDialog(context, AlertDialogType.ERROR),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _paymentSuccessDialog(BuildContext context) {
    return showDialog<dynamic>(
      context: context,
      builder: (_) => PaymentSuccessDialog(),
    );
  }

  Future<dynamic> _alertInfoDialog(BuildContext context) {
    return BeautifulAlertDialog.showInfo(
      context,
      'Do you want to continue to turn off the services?',
      'Alert!',
    );
  }

  Future<dynamic> _alertWarningDialog(BuildContext context) {
    return BeautifulAlertDialog.showWarning(
      context,
      'this is a sample warning?',
      'Warning!',
    );
  }

  Future<dynamic> _alertErrorDialog(BuildContext context) {
    return BeautifulAlertDialog.showError(
      context,
      'this is a sample error?',
      'Error!',
    );
  }

  Future<dynamic> _alertQuestionDialog(BuildContext context) {
    return BeautifulAlertDialog.showQuestion(
      context,
      'this is a sample question?',
      'Question!',
    );
  }

  Future<dynamic> _customAlertDialog(BuildContext context, AlertDialogType type) {
    return showDialog<dynamic>(
      context: context,
      builder: (_) {
        return CustomAlertDialog(
          type: type,
          title: "Beautiful title",
          content: "Information to your user describing the situation.",
        );
      },
    );
  }
}
