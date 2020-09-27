import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'data.dart';
import 'article_card.dart';
import 'article.dart';

class BlogHomePage extends StatefulWidget {
  static final String path = "lib/src/pages/blog/blog_home/page.dart";

  @override
  _BlogHomePageState createState() => _BlogHomePageState();
}

class _BlogHomePageState extends State<BlogHomePage> {
  final List<Article> _articles = getArticles();
  int currentIndex = 1;
  List<BottomNavigationBarItem> bottomNavItems;
  List<String> tabItems;
  List<Widget> tabs;

  @override
  void initState() {
    bottomNavItems = [
      BottomNavigationBarItem(icon: _homeIcon, label: ''),
      BottomNavigationBarItem(icon: _folderOpenIcon, label: ''),
      BottomNavigationBarItem(icon: _favoriteBorderIcon, label: ''),
      BottomNavigationBarItem(icon: _personOutlineIcon, label: ''),
      BottomNavigationBarItem(icon: _settingsIcon, label: ''),
    ];

    tabItems = [
      'For You',
      'Design',
      'Beauty',
      'Education',
      'Entertainment',
    ];

    tabs = List.generate(tabItems.length, (i) => Padding(padding: _insets8, child: Text(tabItems[i])));

    super.initState();
  }

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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (i) => setState(() => currentIndex = i),
            items: bottomNavItems,
          ),
          body: TabBarView(
            children: List.generate(tabItems.length, _buildTabPage),
          ),
        ),
      ),
    );
  }

  Widget get _appBar {
    return AppBar(
      centerTitle: true,
      title: Text('Categories'),
      leading: Platform.isWindows ? null : _categoryIcon,
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
        tabs: tabs,
      ),
    );
  }

  Widget get _tabPageForYou {
    return ListView.separated(
      padding: _insets16,
      itemCount: _articles.length,
      itemBuilder: (_, i) => ArticleCard(item: _articles[i]),
      separatorBuilder: (context, index) => _hbox15,
    );
  }

  Widget _buildTabPage(int index) {
    if (index == 0) {
      return _tabPageForYou;
    }
    return Center(child: Text(tabItems[index]));
  }

  final _boldS20Style = TextStyle(color: _secondaryColor, fontWeight: FontWeight.bold, fontSize: 20);

  final _folderOpenIcon = Icon(FontAwesomeIcons.folderOpen);
  final _categoryIcon = Icon(Icons.category);
  final _searchIcon = Icon(Icons.search);
  final _homeIcon = Icon(Icons.home);
  final _favoriteBorderIcon = Icon(Icons.favorite_border);
  final _personOutlineIcon = Icon(Icons.person_outline);
  final _settingsIcon = Icon(Icons.settings);

  final _insets8 = EdgeInsets.all(8);
  final _insets16 = EdgeInsets.all(16);

  final _hbox15 = SizedBox(height: 15);
}

final _primaryColor = Color(0xffFD6592);
final _secondaryColor = Color(0xff324558);
