import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

Future<bool> canLaunchUrl(String url) {
  return urlLauncher.canLaunch(url);
}

Future<bool> launchUrl(String url) {
  return urlLauncher.launch(url);
}

Future<bool> tryLaunchUrl(String url) async {
  if (await canLaunchUrl(url)) {
    return await launchUrl(url);
  }
  return false;
}

PreferredSize customAppBar({@required BuildContext context}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(100),
    child: Container(
      height: kToolbarHeight + 20,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        trailing: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0)),
          ),
          padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 8.0),
          child: Image.asset('assets/icon/icon.png', width: 20),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 35.0, left: 16.0),
        ),
      ),
    ),
  );
}
