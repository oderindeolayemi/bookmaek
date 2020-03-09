import 'package:flutter/material.dart';

class ChatDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0
      ),
      child: Divider(),
    );
  }
}