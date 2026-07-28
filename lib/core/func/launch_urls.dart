import 'package:url_launcher/url_launcher.dart';

class LaunchUrls {
  static Future<void> launchURL(String approvalUrl) async {
    final uri = Uri.parse(approvalUrl);

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
