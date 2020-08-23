import 'package:flutter/material.dart';

class BottomSheetAwesome extends StatefulWidget {
  static final String path = "lib/src/pages/misc/bottom_sheet_awesome/page.dart";

  @override
  _BottomSheetAwesomeState createState() => _BottomSheetAwesomeState();
}

class _BottomSheetAwesomeState extends State<BottomSheetAwesome> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _pageController = PageController();
  int currentIndex = 0;
  var progress = <int, int>{};

  final description =
      'This layout can be used in many cases a good example is quiz app. The button on action of appbar shows the bottom sheet which contains the list of index of pages in the page and change color upon selecting the page by using select button in the page itself and clicking again disselect the page.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: <Widget>[
          InkWell(
            onTap: () => showAwesomeSheet(),
            child: Container(
              alignment: Alignment.center,
              height: 10,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                progress.length == 0 ? "0/100" : "${progress.length}/100 ",
                style: _whiteStyle,
              ),
            ),
          ),
        ],
        title: Text('Awesome bottom sheet'),
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (i) => setState(() => currentIndex = i),
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(description, textAlign: TextAlign.justify, style: _w600Style),
              ),
              RaisedButton(
                color: progress.containsKey(progress[index]) ? Theme.of(context).primaryColor : Colors.grey.shade800,
                onPressed: () {
                  if (progress.containsKey(progress[index])) {
                    setState(() => progress.remove(progress[index]));
                  } else {
                    setState(() => progress[index] = index);
                  }
                },
                child: Text(
                  progress.containsKey(progress[index])
                      ? 'Unselect Page ${currentIndex + 1}'
                      : 'Select Page ${currentIndex + 1}',
                  style: _whiteStyle,
                ),
              ),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        child: Icon(Icons.chevron_left, color: Colors.white),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          _pageController.animateToPage(
                            _pageController.page.ceil() - 1,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInBack,
                          );
                        },
                      ),
                      SizedBox(width: 5),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Page ${currentIndex + 1}', style: _w700S35Style),
                      ),
                      RaisedButton(
                        child: Icon(Icons.chevron_right, color: Colors.white),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          _pageController.animateToPage(
                            _pageController.page.ceil() + 1,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        itemCount: 100,
      ),
    );
  }

  Future<dynamic> showAwesomeSheet() {
    return showModalBottomSheet<dynamic>(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(" Sheet", style: _s20Style),
                ),
                Divider(height: 0),
                Expanded(
                  child: GridView.builder(
                    itemBuilder: (_, i) => getTile(i),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                    ),
                    itemCount: 100,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget getTile(int index) {
    bool hasVisited = progress[index] != null;
    return GestureDetector(
      onTap: () {
        setState(() {
          _pageController.jumpToPage(index);
          Navigator.pop(context);
        });
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: currentIndex == index ? Theme.of(context).primaryColor : Colors.black12),
          color: hasVisited ? Theme.of(context).primaryColor : Colors.white,
        ),
        child: Text(
          "${index + 1}",
          style: hasVisited ? _whiteStyle : _blackStyle,
        ),
      ),
    );
  }

  final _whiteStyle = TextStyle(color: Colors.white);
  final _blackStyle = TextStyle(color: Colors.black);
  final _w600Style = TextStyle(fontWeight: FontWeight.w600);
  final _w700S35Style = TextStyle(fontWeight: FontWeight.w700, fontSize: 35);
  final _s20Style = TextStyle(fontSize: 20);
}
