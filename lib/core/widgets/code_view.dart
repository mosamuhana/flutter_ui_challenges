import 'dart:math';

import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../github.dart';
import '../helper.dart';
import '../res/code_highlighter.dart';

const _textStyle = TextStyle(fontFamily: 'monospace', fontSize: 12.0);

class MyCodeView extends StatefulWidget {
  final String path;

  MyCodeView({@required this.path});

  @override
  MyCodeViewState createState() => MyCodeViewState();
}

class MyCodeViewState extends State<MyCodeView> {
  double _textScaleFactor = 1.0;

  Widget _getCodeView(String codeContent, BuildContext context) {
    final style = Theme.of(context).brightness == Brightness.dark
        ? SyntaxHighlighterStyle.darkThemeStyle()
        : SyntaxHighlighterStyle.lightThemeStyle();

    final formatedCode = DartSyntaxHighlighter(style).format(codeContent);
    final text = TextSpan(style: _textStyle, children: <TextSpan>[formatedCode]);

    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: RichText(
                textScaleFactor: this._textScaleFactor,
                text: text,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFloatingButtons() {
    String remoteUrl = Github.getFileUrl(widget.path);

    return <Widget>[
      FloatingActionButton(
        heroTag: "copy",
        child: Icon(Icons.content_copy),
        tooltip: 'Copy code link to clipboard',
        onPressed: () async {
          await Clipboard.setData(ClipboardData(text: remoteUrl));
          final snackBar = SnackBar(content: Text('Code link copied to Clipboard!'));
          Scaffold.of(context).showSnackBar(snackBar);
        },
      ),
      FloatingActionButton(
        heroTag: "open",
        child: Icon(Icons.open_in_new),
        tooltip: 'View code on github',
        onPressed: () => tryLaunchUrl(remoteUrl),
      ),
      FloatingActionButton(
        heroTag: "zoom_out",
        child: Icon(Icons.zoom_out),
        tooltip: 'Zoom out',
        onPressed: () => setState(() => this._textScaleFactor = max(0.8, this._textScaleFactor - 0.1)),
      ),
      FloatingActionButton(
        heroTag: "zoom_in",
        child: Icon(Icons.zoom_in),
        tooltip: 'Zoom in',
        onPressed: () => setState(() => this._textScaleFactor += 0.1),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Github.getFileContent(widget.path),
        builder: _builder,
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        fabButtons: _buildFloatingButtons(),
        colorStartAnimation: Colors.indigo,
        colorEndAnimation: Colors.red,
        animatedIconData: AnimatedIcons.menu_close,
      ),
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot<String> snapshot) {
    if (snapshot.hasError) {
      return Center(child: Text('Error loading source code from ${Github.getFileUrl(widget.path)}'));
    }

    if (!snapshot.hasData) {
      return Center(child: CircularProgressIndicator());
    }

    return _getCodeView(snapshot.data, context);
  }
}
