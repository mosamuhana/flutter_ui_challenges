import 'package:flutter/material.dart';

const _primaryColor = Color(0xff696b9e);
const _secondaryColor = Color(0xfff29a94);

const _hbox110 = SizedBox(height: 110);
const _hbox6 = SizedBox(height: 6);
const _wbox5 = SizedBox(width: 5);

const _dropdownMenuItemStyle = TextStyle(color: Colors.black, fontSize: 18);
const _headerTitleStyle = TextStyle(color: Colors.white, fontSize: 24);
const _searchHintStyle = TextStyle(color: Colors.black38, fontSize: 16);
const _itemNameStyle = TextStyle(color: _primaryColor, fontWeight: FontWeight.bold, fontSize: 18);
const _itemInfoStyle = TextStyle(color: _primaryColor, fontSize: 13, letterSpacing: 0.3);

const _menuIcon = Icon(Icons.menu, color: Colors.white);
const _filterListIcon = Icon(Icons.filter_list, color: Colors.white);
const _locationOnIcon = Icon(Icons.location_on, color: _secondaryColor, size: 20);
const _schoolIcon = Icon(Icons.school, color: _secondaryColor, size: 20);

const _circularBottom30 = BorderRadius.only(
  bottomLeft: Radius.circular(30),
  bottomRight: Radius.circular(30),
);
const _circularBorder30 = BorderRadius.all(Radius.circular(30));
final _circularBorder50 = BorderRadius.circular(50);
final _itemLogoBorder = Border.all(width: 2, color: _secondaryColor);

const _paddingHoriz30 = EdgeInsets.symmetric(horizontal: 30);
const _paddingHoriz20Vert10 = EdgeInsets.symmetric(vertical: 10, horizontal: 20);
const _paddingHoriz20 = EdgeInsets.symmetric(horizontal: 20);
const _searchContentPadding = EdgeInsets.symmetric(horizontal: 25, vertical: 13);
const _paddingTop145 = EdgeInsets.only(top: 145);
const _paddingRight15 = EdgeInsets.only(right: 15);

final _schoolContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(25),
  color: Colors.white,
);

const _searchPrefixIcon = Material(
  elevation: 0,
  borderRadius: _circularBorder30,
  child: Icon(Icons.search),
);

class SchoolList extends StatefulWidget {
  static final String path = "lib/src/pages/lists/list2.dart";

  _SchoolListState createState() => _SchoolListState();
}

class _SchoolListState extends State<SchoolList> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              _list,
              _header,
              _search,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _list {
    return Container(
      padding: _paddingTop145,
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (_, i) => _School(item: _items[i]),
      ),
    );
  }

  Widget get _header {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: _primaryColor,
        borderRadius: _circularBottom30,
      ),
      child: Padding(
        padding: _paddingHoriz30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: _menuIcon,
            ),
            Text("Institutes", style: _headerTitleStyle),
            IconButton(
              onPressed: () {},
              icon: _filterListIcon,
            ),
          ],
        ),
      ),
    );
  }

  Widget get _search {
    return Container(
      child: Column(
        children: [
          _hbox110,
          Padding(
            padding: _paddingHoriz20,
            child: Material(
              elevation: 5,
              borderRadius: _circularBorder30,
              child: TextField(
                // controller: TextEditingController(text: locations[0]),
                cursorColor: Theme.of(context).primaryColor,
                style: _dropdownMenuItemStyle,
                decoration: InputDecoration(
                  hintText: "Search School",
                  hintStyle: _searchHintStyle,
                  prefixIcon: _searchPrefixIcon,
                  border: InputBorder.none,
                  contentPadding: _searchContentPadding,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _School extends StatelessWidget {
  final _Item item;

  const _School({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _schoolContainerDecoration,
      width: double.infinity,
      height: 110,
      margin: _paddingHoriz20Vert10,
      padding: _paddingHoriz20Vert10,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            margin: _paddingRight15,
            decoration: BoxDecoration(
              borderRadius: _circularBorder50,
              border: _itemLogoBorder,
              image: DecorationImage(
                image: NetworkImage(item.logo),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: _itemNameStyle),
                _hbox6,
                Row(
                  children: [
                    _locationOnIcon,
                    _wbox5,
                    Text(item.location, style: _itemInfoStyle),
                  ],
                ),
                _hbox6,
                Row(
                  children: [
                    _schoolIcon,
                    _wbox5,
                    Text(item.type, style: _itemInfoStyle),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

final _items = <_Item>[
  _Item(
    name: "Edgewick Scchol",
    location: "572 Statan NY, 12483",
    type: "Higher Secondary School",
    logo: "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png",
  ),
  _Item(
    name: "Xaviers International",
    location: "234 Road Kathmandu, Nepal",
    type: "Higher Secondary School",
    logo: "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png",
  ),
  _Item(
    name: "Kinder Garden",
    location: "572 Statan NY, 12483",
    type: "Play Group School",
    logo: "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png",
  ),
  _Item(
    name: "WilingTon Cambridge",
    location: "Kasai Pantan NY, 12483",
    type: "Lower Secondary School",
    logo: "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png",
  ),
  _Item(
    name: "Fredik Panlon",
    location: "572 Statan NY, 12483",
    type: "Higher Secondary School",
    logo: "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png",
  ),
  _Item(
    name: "Whitehouse International",
    location: "234 Road Kathmandu, Nepal",
    type: "Higher Secondary School",
    logo: "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png",
  ),
  _Item(
    name: "Haward Play",
    location: "572 Statan NY, 12483",
    type: "Play Group School",
    logo: "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png",
  ),
  _Item(
    name: "Campare Handeson",
    location: "Kasai Pantan NY, 12483",
    type: "Lower Secondary School",
    logo: "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png",
  ),
];

class _Item {
  final String name;
  final String location;
  final String type;
  final String logo;
  _Item({
    this.name,
    this.location,
    this.type,
    this.logo,
  });
}
