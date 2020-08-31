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
