import 'package:flutter/material.dart';

class VideoListWidget extends StatelessWidget {
  const VideoListWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.accents[index % Colors.accents.length],
    );
  }
}
