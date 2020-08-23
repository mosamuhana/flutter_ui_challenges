import 'package:flutter/material.dart';

class MusicPlayerOnePage extends StatefulWidget {
  static final String path = "lib/src/pages/misc/musicplayer_one/page.dart";

  @override
  _MusicPlayerOnePageState createState() => _MusicPlayerOnePageState();
}

class _MusicPlayerOnePageState extends State<MusicPlayerOnePage> {
  final _roomImage = 'assets/hotel/room2.jpg';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double height = size.height;
    double topHeight = height * 0.4;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: topHeight,
                        width: size.width,
                        child: Image.asset(_roomImage, fit: BoxFit.cover),
                      ),
                      IconButton(
                        icon: _arrowBackIcon,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  Container(
                    height: height * 0.6,
                    decoration: _listDecoration,
                    child: Column(
                      children: [
                        _hbox25,
                        Text(' Buffering... ', style: _whiteS15Style),
                        _progress,
                        Expanded(
                          child: ListView.builder(
                            physics: _listPhysics,
                            itemCount: 6,
                            itemBuilder: (_, i) => _createItem(i),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: size.width * 0.15,
                top: topHeight - 35,
                child: FractionalTranslation(
                  translation: Offset(0, 0.5),
                  child: _player,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _player {
    final size = MediaQuery.of(context).size;

    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          alignment: Alignment.topCenter,
          height: 35,
          width: size.width * 0.7,
          margin: _insetsB6,
          decoration: _playerDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: _skipPreviousIcon,
                onPressed: () {},
              ),
              IconButton(
                icon: _fastRewindIcon,
                onPressed: () {},
              ),
              _wbox25,
              IconButton(
                icon: _fastForwardIcon,
                onPressed: () {},
              ),
              IconButton(
                icon: _skipNextIcon,
                onPressed: () {},
              ),
            ],
          ),
        ),
        Positioned(
          left: 77,
          right: 77,
          bottom: 2,
          child: Container(
            decoration: _playButtonDecoration,
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 25,
              child: IconButton(
                icon: _playArrowIcon,
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget get _progress {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _wbox10,
        Text('00:00', style: _whiteS15Style),
        _wbox10,
        Expanded(child: _whiteDivider5),
        _wbox10,
        Text('00:00', style: _whiteS15Style),
        _wbox10,
      ],
    );
  }

  Widget _createItem(int index) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          leading: Text('${index + 1}.', style: _whiteS20Style),
          title: Text(' Episode ${index + 1}', style: _whiteS20Style),
          subtitle: Text(' sid', style: _whiteW200S12Style),
          trailing: IconButton(
            onPressed: () {},
            icon: _playArrowIcon,
          ),
        ),
        _whiteDivider1,
      ],
    );
  }

  final _wbox10 = SizedBox(width: 10);
  final _wbox25 = SizedBox(width: 25);
  final _hbox25 = SizedBox(height: 25);

  final _insetsB6 = EdgeInsets.only(bottom: 6);

  final _whiteS20Style = TextStyle(color: Colors.white, fontSize: 20);
  final _whiteS15Style = TextStyle(color: Colors.white, fontSize: 15);
  final _whiteW200S12Style = TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w200);

  final _whiteDivider5 = Divider(height: 5, color: Colors.white);
  final _whiteDivider1 = Divider(height: 1, color: Colors.white);

  final _arrowBackIcon = Icon(Icons.arrow_back, color: Colors.white);
  final _playArrowIcon = Icon(Icons.play_arrow, color: Colors.white);
  final _skipPreviousIcon = Icon(Icons.skip_previous, color: Colors.white);
  final _fastRewindIcon = Icon(Icons.fast_rewind, color: Colors.white);
  final _fastForwardIcon = Icon(Icons.fast_forward, color: Colors.white);
  final _skipNextIcon = Icon(Icons.skip_next, color: Colors.white);

  final _playerDecoration = BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(50),
    boxShadow: [BoxShadow(blurRadius: 5)],
  );

  final _playButtonDecoration = BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.blue,
    boxShadow: [BoxShadow(blurRadius: 5)],
  );

  final _listDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0, 0.5, 1],
      colors: [
        Color(0xFF014F82),
        Color(0xff00395f),
        Color(0xFF001726),
      ],
    ),
  );

  final _listPhysics = BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}
