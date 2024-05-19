import 'package:url_launcher/url_launcher.dart';

class LunchUrlService {
  Future<void> launchPhone(phone) async {
    if (!await launch("tel:$phone")) {
      throw 'Could not launch $phone';
    }
  }

  Future<void> launchUri(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchEmail(email) async {
    if (!await launchUrl(Uri.parse("mailto:$email"))) {
      throw 'Could not launch $email';
    }
  }
}
