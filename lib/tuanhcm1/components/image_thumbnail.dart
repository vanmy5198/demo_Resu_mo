import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageThumbnail extends StatelessWidget {
  final resource = 'https://baconmockup.com/300/200';
  @override
  Widget build(BuildContext context) {
    return Ink.image(
      image: NetworkImage(
        'https://baconmockup.com/300/200',
      ),
      fit: BoxFit.fill,
    );
  }
}
