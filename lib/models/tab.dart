import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Tabs{
  String url;
  String title;
  String key;
  double progress;
  InAppWebViewController controller;

  Tabs(
    {
      this.url,
      this.title,
      this.key,
      this.progress,
      this.controller
    }
  );
}