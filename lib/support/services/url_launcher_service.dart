import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static Future<void> launchInExternalApp(Uri? uri) async {
    if (uri != null) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
