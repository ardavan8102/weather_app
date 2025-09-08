import 'package:url_launcher/url_launcher.dart';

LaunchURLBrowser(String url) async {
  var _url = Uri.parse(url);
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
              throw Exception('Could not launch $_url');
      }
}