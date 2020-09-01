import 'package:flutter/material.dart';

// This widget is always kept alive, so that when tab is switched back, its
// child's state is still preserved.
class AlwaysAlive extends StatefulWidget {
  final Widget child;

  const AlwaysAlive({Key key, @required this.child}) : super(key: key);

  @override
  _AlwaysAliveState createState() => _AlwaysAliveState();
}

class _AlwaysAliveState extends State<AlwaysAlive> with AutomaticKeepAliveClientMixin<AlwaysAlive> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return this.widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
