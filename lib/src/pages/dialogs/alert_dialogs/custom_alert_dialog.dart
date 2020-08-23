import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final AlertDialogType type;
  final String title;
  final String content;
  final Widget icon;
  final String buttonLabel;

  CustomAlertDialog({
    Key key,
    this.title = "Successful",
    @required this.content,
    this.icon,
    this.type = AlertDialogType.INFO,
    this.buttonLabel = "Ok",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        alignment: Alignment.center,
        child: Container(
          margin: _dialogMargin,
          padding: _dialogPadding,
          decoration: _dialogDecoration,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _hbox10,
              icon ?? _alertIcon,
              _hbox10,
              Text(title, style: _blackBoldS20Style, textAlign: TextAlign.center),
              _divider,
              Text(content, textAlign: TextAlign.center),
              _hbox40,
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  padding: _buttonMargin,
                  child: Text(buttonLabel),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _alertIcon {
    IconData _iconData;
    Color _color;

    switch (type) {
      case AlertDialogType.WARNING:
        _iconData = Icons.warning;
        break;
      case AlertDialogType.SUCCESS:
        _iconData = Icons.check_circle;
        break;
      case AlertDialogType.ERROR:
        _iconData = Icons.error;
        break;
      case AlertDialogType.INFO:
      default:
        _iconData = Icons.info_outline;
        break;
    }

    switch (type) {
      case AlertDialogType.WARNING:
        _color = Colors.orange;
        break;
      case AlertDialogType.SUCCESS:
        _color = Colors.green;
        break;
      case AlertDialogType.ERROR:
        _color = Colors.red;
        break;
      case AlertDialogType.INFO:
      default:
        _color = Colors.blue;
        break;
    }

    return Icon(_iconData, color: _color, size: 50);
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox40 = SizedBox(height: 40);

  final _buttonMargin = EdgeInsets.all(5);
  final _dialogMargin = EdgeInsets.all(8);
  final _dialogPadding = EdgeInsets.all(20);

  final _blackBoldS20Style = TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);

  final _dialogDecoration = BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white);

  final _divider = Divider();
}

enum AlertDialogType {
  SUCCESS,
  ERROR,
  WARNING,
  INFO,
}
