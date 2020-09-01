import 'dart:math';

import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../github.dart';
import '../helper.dart';
import '../res/code_highlighter.dart';

class CodeView extends StatefulWidget {
  final String path;

  CodeView({@required this.path});

  @override
  _CodeViewState createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  DartSyntaxHighlighter _syntaxHighlighter;
  double _textScaleFactor = 1.0;

  SyntaxHighlighter get syntaxHighlighter {
    if (_syntaxHighlighter == null) {
      final style = Theme.of(context).brightness == Brightness.dark
          ? SyntaxHighlighterStyle.darkThemeStyle()
          : SyntaxHighlighterStyle.lightThemeStyle();

      _syntaxHighlighter = DartSyntaxHighlighter(style);
    }
    return _syntaxHighlighter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
      floatingActionButton: AnimatedFloatingActionButton(
        fabButtons: _floatingButtons,
        colorStartAnimation: Colors.indigo,
        colorEndAnimation: Colors.red,
        animatedIconData: AnimatedIcons.menu_close,
      ),
    );
  }

  Widget get _body {
    return FutureBuilder(
      future: Github.getFileContent(widget.path),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error loading source code from ${Github.getFileUrl(widget.path)}'));
        }

        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final formatedCode = syntaxHighlighter.format(snapshot.data);
        final text = TextSpan(style: _textStyle, children: [formatedCode]);

        return Padding(
          padding: EdgeInsets.all(4),
          child: Container(
            constraints: BoxConstraints.expand(),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: RichText(textScaleFactor: this._textScaleFactor, text: text),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> get _floatingButtons {
    String remoteUrl = Github.getFileUrl(widget.path);

    return [
      FloatingActionButton(
        heroTag: "copy",
        child: Icon(Icons.content_copy),
        tooltip: 'Copy code link to clipboard',
        onPressed: () async {
          await Clipboard.setData(ClipboardData(text: remoteUrl));
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('Code link copied to Clipboard!')),
          );
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

  final _textStyle = TextStyle(fontFamily: 'monospace', fontSize: 12);
}
