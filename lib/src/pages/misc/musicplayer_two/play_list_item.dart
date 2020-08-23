import 'package:flutter/material.dart';

import 'play_item.dart';

class PlayListItem extends StatefulWidget {
  final PlayItem item;
  final bool playing;
  final int progress;

  PlayListItem({
    Key key,
    @required this.item,
    this.playing = false,
    this.progress = 0,
  }) : super(key: key);

  @override
  _PlayListItemState createState() => _PlayListItemState();
}

class _PlayListItemState extends State<PlayListItem> {
  @override
  Widget build(BuildContext context) {
    final tile = ListTile(
      leading: _leading,
      title: Text(widget.item.artist),
      subtitle: _subtitle,
      trailing: Text(widget.item.time),
    );

    if (!widget.playing) return tile;
    return Column(
      children: [
        tile,
        _progress,
      ],
    );
  }

  Widget get _leading => widget.playing ? _pauseIcon : _playArrowIcon;

  Widget get _subtitle {
    final text = Text(widget.item.title);
    if (!widget.playing) {
      return text;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text,
        _hbox10,
      ],
    );
  }

  Widget get _progress {
    return Padding(
      padding: _insetsL70R20,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 300,
            height: 2,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _insetsL70R20 = EdgeInsets.only(left: 70, right: 20);

  final _playArrowIcon = Icon(Icons.play_arrow);
  final _pauseIcon = Icon(Icons.pause);
}
