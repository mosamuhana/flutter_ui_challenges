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
        actions: [
          InkWell(
            onTap: () => showAwesomeSheet(),
            child: Container(
              alignment: Alignment.center,
              height: 10,
              margin: _insets8,
              padding: _insetsH8,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: _circularBorder10,
              ),
              child: Text("${progress.length == 0 ? 0 : progress.length}/100 ", style: _whiteStyle),
            ),
          ),
        ],
        title: Text('Awesome bottom sheet'),
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (i) => setState(() => currentIndex = i),
        itemBuilder: _pageViewItemBuilder,
        itemCount: 100,
      ),
    );
  }

  Widget _pageViewItemBuilder(context, index) {
    final pageNum = currentIndex + 1;
    final inProgress = progress.containsKey(progress[index]);
    final buttonText = inProgress ? 'Unselect Page $pageNum' : 'Select Page $pageNum';
    final buttonColor = inProgress ? Theme.of(context).primaryColor : Colors.grey.shade800;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: _insets16,
          child: Text(
            description,
            textAlign: TextAlign.justify,
            style: _w600Style,
          ),
        ),
        RaisedButton(
          color: buttonColor,
          onPressed: () {
            if (inProgress) {
              progress.remove(progress[index]);
            } else {
              progress[index] = index;
            }
            setState(() {});
          },
          child: Text(buttonText, style: _whiteStyle),
        ),
        Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  child: _chevronLeftIcon,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    _pageController.animateToPage(
                      _pageController.page.ceil() - 1,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInBack,
                    );
                  },
                ),
                _wbox5,
                Container(
                  padding: _insetsL15T0R10B0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                    borderRadius: _circularBorder10,
                  ),
                  child: Text('Page $pageNum', style: _w700S35Style),
                ),
                RaisedButton(
                  child: _chevronRightIcon,
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
  }

  Future<dynamic> showAwesomeSheet() {
    void onTap(int index) {
      setState(() {
        _pageController.jumpToPage(index);
        Navigator.pop(context);
      });
    }

    return showModalBottomSheet<dynamic>(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: _insets10,
                  child: Text(" Sheet", style: _s20Style),
                ),
                Divider(height: 0),
                Expanded(
                  child: GridView.builder(
                    itemBuilder: (_, i) => getTile(i, onTap),
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

  Widget getTile(int index, ValueChanged<int> onTap) {
    bool hasVisited = progress[index] != null;
    final borderColor = currentIndex == index ? Theme.of(context).primaryColor : Colors.black12;
    final color = hasVisited ? Theme.of(context).primaryColor : Colors.white;
    final style = hasVisited ? _whiteStyle : _blackStyle;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        margin: _insets5,
        padding: _insets5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: _circularBorder5,
          border: Border.all(color: borderColor),
          color: color,
        ),
        child: Text("${index + 1}", style: style),
      ),
    );
  }

  final _wbox5 = SizedBox(width: 5);

  final _whiteStyle = TextStyle(color: Colors.white);
  final _blackStyle = TextStyle(color: Colors.black);
  final _w600Style = TextStyle(fontWeight: FontWeight.w600);
  final _w700S35Style = TextStyle(fontWeight: FontWeight.w700, fontSize: 35);
  final _s20Style = TextStyle(fontSize: 20);

  final _insets5 = EdgeInsets.all(5);
  final _insets8 = EdgeInsets.all(8);
  final _insets10 = EdgeInsets.all(10);
  final _insets16 = EdgeInsets.all(16);
  final _insetsH8 = EdgeInsets.symmetric(horizontal: 8);
  final _insetsL15T0R10B0 = EdgeInsets.fromLTRB(15, 0, 10, 0);

  final _circularBorder5 = BorderRadius.circular(5);
  final _circularBorder10 = BorderRadius.circular(10);

  final _chevronLeftIcon = Icon(Icons.chevron_left, color: Colors.white);
  final _chevronRightIcon = Icon(Icons.chevron_right, color: Colors.white);
}
