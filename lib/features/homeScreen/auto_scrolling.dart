import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/features/homeScreen/my_search_bar.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int myCurrentIndex = 0;
  List<Widget> images = [
    MyImage(imagePath: 'https://picsum.photos/300/200?random=2'),
    MyImage(imagePath: 'https://picsum.photos/300/200?random=3'),
    MyImage(imagePath: 'https://picsum.photos/300/200?random=4'),
    MyImage(imagePath: 'https://picsum.photos/300/200?random=5'),
    MyImage(imagePath: 'https://picsum.photos/300/200?random=6'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250.h,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) => images[index],
                options: CarouselOptions(
                  autoPlay: true,
                  height: 200.h,
                  aspectRatio: 16 / 9,
                  // reverse: true,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      myCurrentIndex = index;
                    });
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 20,
                right: 20,
                child: MySearchBar(),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class MyImage extends StatelessWidget {
  final String imagePath;

  const MyImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      fit: BoxFit.fill,
      width: 500,
      height: 200,
    );
  }
}
