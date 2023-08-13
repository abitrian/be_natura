import 'package:url_launcher/url_launcher.dart';

class BNNavigator {

  Future<void> launchURL(String urlToGo) async {
    final Uri url = Uri.parse(urlToGo);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}