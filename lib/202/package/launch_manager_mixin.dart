import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

mixin LaunchManagerMixin<T extends StatefulWidget> on State<T> {
  Future<void> goToExternalUrl(String urlStr) async {
    Uri url = Uri.parse(urlStr);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
