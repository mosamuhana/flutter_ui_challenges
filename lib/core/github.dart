import 'package:http/http.dart' as http;

class Github {
  static const String accountName = 'mosamuhana';
  static const String repositoryName = 'flutter_ui_challenges';
  static const String branch = 'master';

  static const String youtubeChannel = "https://youtube.com/c/reactbits";
  static const String privacyUrl = "https://popupbits.com/contact/flutter-ui-challenges-privacy-policy/";

  static String get repositoryUrl => 'https://github.com/$accountName/$repositoryName';
  static String get repositoryUrlRaw => 'https://raw.githubusercontent.com/$accountName/$repositoryName';

  static String getFileUrl(String filePath) => '$repositoryUrl/blob/$branch/$filePath';

  static String getFileContentUrl(String filePath) => '$repositoryUrlRaw/$branch/$filePath';

  static Future<String> getFileContent(String filePath) async {
    final url = getFileContentUrl(filePath);
    final res = await http.get(url);
    return res.body;
  }
}
