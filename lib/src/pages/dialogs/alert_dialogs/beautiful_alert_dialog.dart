import 'package:flutter/material.dart';

//import '../../../../core/constants.dart';
//import '../../../../core/widgets/p_network_image.dart';

class BeautifulAlertDialog extends StatelessWidget {
  final String title; // = 'Alert!';
  final String message; // = 'Do you want to continue to turn off the services?';
  final IconData icon;
  final AlertType type;
  final String positiveText;
  final String negativeText;
  final Color positiveColor;
  final Color negativeColor;
  final Color iconColor;
  final double iconSize;

  BeautifulAlertDialog._({
    this.title,
    this.message,
    this.icon,
    this.type,
    this.positiveText,
    this.negativeText,
    this.positiveColor = Colors.green,
    this.negativeColor = Colors.red,
    this.iconColor = Colors.black,
    this.iconSize = 80,
  });

  @override
  Widget build(BuildContext context) {
    var _icon = _alertIcon;
    return Center(
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: _insetsR16,
          height: 150,
          decoration: _dialogDecoration,
          child: Row(
            children: [
              if (_icon != null) ...[
                _wbox20,
                _icon,
                _wbox20,
              ],
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title?.isNotEmpty) ...[
                      Text(title, style: Theme.of(context).textTheme.headline6),
                      _hbox10,
                    ],
                    Flexible(child: Text(message)),
                    _hbox10,
                    _buildButtons(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    final _positive = Expanded(
      child: RaisedButton(
        child: Text(positiveText ?? (type == AlertType.question ? 'Yes' : 'Ok')),
        color: positiveColor,
        colorBrightness: Brightness.dark,
        onPressed: () => Navigator.pop(context, true),
        shape: _roundedRectangleBorderShape20,
      ),
    );

    final _negative = Expanded(
      child: RaisedButton(
        child: Text(negativeText ?? 'No'),
        color: negativeColor,
        colorBrightness: Brightness.dark,
        onPressed: () => Navigator.pop(context, false),
        shape: _roundedRectangleBorderShape20,
      ),
    );

    if (type != AlertType.question) {
      return Row(
        children: [
          _wbox10,
          _positive,
          _wbox10,
        ],
      );
    }

    return Row(
      children: [
        _negative,
        _wbox10,
        _positive,
      ],
    );
  }

  Widget get _alertIcon {
    Icon getIcon(IconData x) => Icon(x, size: iconSize, color: iconColor);

    if (icon != null) {
      return getIcon(icon);
    }

    if (type != null) {
      switch (type) {
        case AlertType.info:
          return getIcon(_icons['info']);
        case AlertType.warning:
          return getIcon(_icons['warning']);
        case AlertType.error:
          return getIcon(_icons['error']);
        case AlertType.question:
          return getIcon(_icons['question']);
      }
    }
    return null;
  }

  final _wbox10 = SizedBox(width: 10);
  final _wbox20 = SizedBox(width: 20);
  final _hbox10 = SizedBox(height: 10);

  final _insetsR16 = EdgeInsets.only(right: 16);

  final _roundedRectangleBorderShape20 = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  final _dialogDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(75),
      bottomLeft: Radius.circular(75),
      topRight: Radius.circular(10),
      bottomRight: Radius.circular(10),
    ),
  );

  // Static methods

  static Future<bool> show(
    BuildContext context, {
    @required String message,
    String title,
    IconData icon,
    AlertType type,
    String positiveText,
    String negativeText,
    Color positiveColor = Colors.green,
    Color negativeColor = Colors.red,
    Color iconColor = Colors.black,
    double iconSize = 80,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (_) => BeautifulAlertDialog._(
        title: title,
        message: message,
        icon: icon,
        type: type,
        positiveText: positiveText,
        negativeText: negativeText,
        positiveColor: positiveColor,
        negativeColor: negativeColor,
        iconColor: iconColor,
        iconSize: iconSize,
      ),
    );
  }

  static Future<bool> showInfo(BuildContext context, String message, [String title]) {
    return show(
      context,
      title: title,
      message: message,
      type: AlertType.info,
    );
  }

  static Future<bool> showWarning(BuildContext context, String message, [String title]) {
    return show(
      context,
      title: title,
      message: message,
      type: AlertType.warning,
    );
  }

  static Future<bool> showError(BuildContext context, String message, [String title]) {
    return show(
      context,
      title: title,
      message: message,
      type: AlertType.error,
    );
  }

  static Future<bool> showQuestion(BuildContext context, String message, [String title]) {
    return show(
      context,
      title: title,
      message: message,
      type: AlertType.question,
    );
  }
}

//const _infoIcon = '$STORE_BASE_URL/img%2Finfo-icon.png?alt=media';

const _icons = <String, IconData>{
  'info': Icons.info_outline,
  'warning': Icons.warning_amber_rounded,
  'error': Icons.error_sharp,
  'question': Icons.question_answer_outlined
};

enum AlertType {
  info,
  warning,
  error,
  question,
}
