import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({super.key});

  final List imageList = [
    "https://www.themoviedb.org/t/p/w1280/8xV47NDrjdZDpkVcCFqkdHa3T0C.jpg",
    "https://www.themoviedb.org/t/p/w1280/jLLtx3nTRSLGPAKl4RoIv1FbEBr.jpg",
    "https://www.themoviedb.org/t/p/w1280/7Bd4EUOqQDKZXA6Od5gkfzRNb0.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView(
        children: [
          const _SmartDownloads(),
          const Text(
            'Introducing Downloads for you.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'We will download a personalised selection of movies and shows for you, So there is always something to watch on your device',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: size.width,
            height: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * 0.35,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                ),
                DownloadsImageWidgets(
                  size: Size(size.width * 0.4 - 10, size.width * 0.58 - 10),
                  imageList: imageList[0],
                  angle: 20,
                  margin: const EdgeInsets.only(
                    left: 130,
                  ),
                ),
                DownloadsImageWidgets(
                  size: Size(size.width * 0.4 - 10, size.width * 0.58 - 10),
                  imageList: imageList[1],
                  angle: -20,
                  margin: const EdgeInsets.only(
                    right: 130,
                  ),
                ),
                DownloadsImageWidgets(
                  size: Size(size.width * 0.4 - 10, size.width * 0.58),
                  imageList: imageList[2],
                  angle: 0,
                  margin: const EdgeInsets.only(
                    top: 20,
                    left: 0,
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Setup',
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          MaterialButton(
            color: kWhiteColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'See what you can download',
                style: TextStyle(
                  color: backgroundColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text('Smart Downloads')
      ],
    );
  }
}

class DownloadsImageWidgets extends StatelessWidget {
  const DownloadsImageWidgets({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageList,
            ),
          ),
        ),
      ),
    );
  }
}
