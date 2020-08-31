import 'package:flutter/material.dart';

//import '../../../core/ui_constants.dart';
import 'widgets/profile/profile_categories.dart';
import 'widgets/profile/profile_detail.dart';
import 'widgets/profile/profile_menu.dart';
import 'widgets/title_large.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _buildContent(context),
    );
  }

  Widget get _content {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleLarge(title: 'Center'),
            _hbox20,
            ProfileDetail(),
            _hbox30,
            ProfileCategories(),
            _hbox30,
            Flexible(child: ProfileMenu()),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _hbox20,
                TitleLarge(title: 'Center'),
                _hbox20,
                ProfileDetail(),
                _hbox30,
                ProfileCategories(),
                _hbox30,
                Flexible(child: ProfileMenu()),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text('AAAAAAAA'),
              leading: BackButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  final _hbox20 = SizedBox(height: 20);
  final _hbox30 = SizedBox(height: 30);
}
