import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants.dart';
import '../../../core/ui_constants.dart';
import '../../../core/widgets.dart';

class BlogHomeOnePage extends StatefulWidget {
  static final String path = "lib/src/pages/blog/bhome1.dart";

  @override
  _BlogHomeOnePageState createState() => _BlogHomeOnePageState();
}

class _BlogHomeOnePageState extends State<BlogHomeOnePage> {
  int currentNavIndex = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Theme(
        data: ThemeData(
          primaryColor: _primaryColor,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            textTheme: TextTheme(headline6: _boldS20Style),
            iconTheme: IconThemeData(color: _secondaryColor),
            actionsIconTheme: IconThemeData(color: _secondaryColor),
          ),
        ),
        child: Scaffold(
          backgroundColor: Theme.of(context).buttonColor,
          appBar: _appBar,
          body: TabBarView(
            children: [
              _tabPageForYou,
              _tabPageDesign,
              _tabPageBeauty,
              _tabPageEducation,
              _tabPageEntertainment,
            ],
          ),
          bottomNavigationBar: _bottomNavigationBar,
        ),
      ),
    );
  }

  Widget get _appBar {
    return AppBar(
      centerTitle: true,
      title: Text('Categories'),
      leading: _categoryIcon,
      actions: [
        IconButton(
          icon: _searchIcon,
          onPressed: () {},
        )
      ],
      bottom: TabBar(
        isScrollable: true,
        labelColor: _primaryColor,
        indicatorColor: _primaryColor,
        unselectedLabelColor: _secondaryColor,
        tabs: [
          _createTab('For You'),
          _createTab('Design'),
          _createTab('Beauty'),
          _createTab('Education'),
          _createTab('Entertainment'),
        ],
      ),
    );
  }

  Widget get _bottomNavigationBar {
    return BottomNavigationBar(
      currentIndex: currentNavIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (i) => setState(() => currentNavIndex = i),
      items: [
        _createNavItem(_homeIcon),
        _createNavItem(_folderOpenIcon),
        _createNavItem(_favoriteBorderIcon),
        _createNavItem(_personOutlineIcon),
        _createNavItem(_settingsIcon),
      ],
    );
  }

  Widget get _tabPageForYou {
    return ListView.separated(
      padding: _insets16,
      itemCount: _articles.length,
      itemBuilder: (_, i) => _ArticleCard(item: _articles[i]),
      separatorBuilder: (context, index) => hSizedBox15,
    );
  }

  Widget get _tabPageDesign => _createTabPageContent('Design content');
  Widget get _tabPageBeauty => _createTabPageContent('Beauty content');
  Widget get _tabPageEducation => _createTabPageContent('Education content');
  Widget get _tabPageEntertainment => _createTabPageContent('Entertainment content');

  Widget _createTab(String title) => Padding(padding: _insets8, child: Text(title));

  Widget _createTabPageContent(String content) {
    return Center(
      child: Text(content),
    );
  }

  BottomNavigationBarItem _createNavItem(Icon icon) => BottomNavigationBarItem(icon: icon, title: Text(""));
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _ArticleCard extends StatelessWidget {
  final _Article item;

  const _ArticleCard({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            width: 90,
            height: 90,
            color: _bgColor,
          ),
          Container(
            color: Colors.white,
            padding: _insets16,
            margin: _insets16,
            child: Row(
              children: [
                _image,
                wSizedBox20,
                Expanded(child: Column(children: [_title, _info])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _image {
    return Container(
      height: 100,
      color: Colors.blue,
      width: 80,
      child: PNetworkImage(item.image, fit: BoxFit.cover),
    );
  }

  Widget get _title {
    return Text(
      item.title,
      textAlign: TextAlign.justify,
      style: _boldS18Style,
    );
  }

  Widget get _info {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: CircleAvatar(radius: 15, backgroundColor: _primaryColor),
          ),
          WidgetSpan(child: wSizedBox5),
          TextSpan(text: item.author, style: _s16Style),
          WidgetSpan(child: wSizedBox20),
          WidgetSpan(child: wSizedBox5),
          TextSpan(text: item.time),
        ],
      ),
      style: _h2Style,
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

final _articles = <_Article>[
  _Article(
    title: "How to Seem Like You Always Have Your Shot Together",
    author: "Jonhy Vino",
    time: "4 min read",
    image: _sampleImage,
  ),
  _Article(
    title: "Does Dry is January Actually Improve Your Health?",
    author: "Jonhy Vino",
    time: "4 min read",
    image: _sampleImage,
  ),
  _Article(
    title: "You do hire a designer to make something. You hire them.",
    author: "Jonhy Vino",
    time: "4 min read",
    image: _sampleImage,
  ),
  _Article(
    title: "How to Seem Like You Always Have Your Shot Together",
    author: "Jonhy Vino",
    time: "4 min read",
    image: _sampleImage,
  ),
  _Article(
    title: "How to Seem Like You Always Have Your Shot Together",
    author: "Jonhy Vino",
    time: "4 min read",
    image: _sampleImage,
  ),
  _Article(
    title: "Does Dry is January Actually Improve Your Health?",
    author: "Jonhy Vino",
    time: "4 min read",
    image: _sampleImage,
  ),
  _Article(
    title: "You do hire a designer to make something. You hire them.",
    author: "Jonhy Vino",
    time: "4 min read",
    image: _sampleImage,
  ),
  _Article(
    title: "How to Seem Like You Always Have Your Shot Together",
    author: "Jonhy Vino",
    time: "4 min read",
    image: _sampleImage,
  ),
];

class _Article {
  final String title;
  final String author;
  final String time;
  final String image;
  _Article({this.title, this.author, this.time, this.image});
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _sampleImage = '$STORE_BASE_URL/img%2F3.jpg?alt=media';

const _primaryColor = Color(0xffFD6592);
const _secondaryColor = Color(0xff324558);
const _bgColor = Color(0xffF9E0E3);

const _boldS20Style = TextStyle(color: _secondaryColor, fontWeight: FontWeight.bold, fontSize: 20);
const _boldS18Style = TextStyle(color: _secondaryColor, fontWeight: FontWeight.bold, fontSize: 18);
const _s16Style = TextStyle(fontSize: 16);
const _h2Style = TextStyle(height: 2);

const _folderOpenIcon = Icon(FontAwesomeIcons.folderOpen);
const _categoryIcon = Icon(Icons.category);
const _searchIcon = Icon(Icons.search);
const _homeIcon = Icon(Icons.home);
final _favoriteBorderIcon = Icon(Icons.favorite_border);
final _personOutlineIcon = Icon(Icons.person_outline);
final _settingsIcon = Icon(Icons.settings);

const _insets8 = EdgeInsets.all(8);
const _insets16 = EdgeInsets.all(16);
