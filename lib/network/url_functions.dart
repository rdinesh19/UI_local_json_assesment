
// This function is triggered when the search field changes
import 'package:url_launcher/url_launcher.dart';


Future<void> launchUrlWeb(String url) async {
  Uri uri = Uri.parse(url);
  if (!await launchUrl(uri,mode: LaunchMode.inAppBrowserView)) {
    throw 'Could not launch $url';
  }
}
// Method to launch the default email app with a prefilled email
Future<void> launchEmail(String email) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      'subject': 'Contact Inquiry'
    },
  );
  if (!await launchUrl(emailUri)) {
    throw 'Could not launch $emailUri';
  }
}
