import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String begin;
  final String end;
  final String sessionsTitle;
  const CustomListTile({
    Key? key,
    required this.begin,
    required this.end,
    required this.sessionsTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Duration : $begin-$end',
      ),
      subtitle: Text(
        '• $sessionsTitle',
      ),
    );
  }
}
