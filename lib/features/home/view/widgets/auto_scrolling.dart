import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/features/home/view/widgets/my_search_bar.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int myCurrentIndex = 0;
  List<Widget> images = [
    MyImage(
        imagePath:
            'https://th.bing.com/th/id/OIP.D1SvIgU-BYYZ822UmxBEJgHaE1?rs=1&pid=ImgDetMain'),
    MyImage(
        imagePath:
            'https://bing.com/th?id=OSGI.F80C862D357A4C2580D5B9C71AB23127&h=1000&w=1920&c=1&rs=1'),
    MyImage(
        imagePath:
            'https://bing.com/th?id=OSGI.5B7E4253C16AFA63FAEB8B8E07A37207&h=1000&w=1920&c=1&rs=1'),
    MyImage(
        imagePath:
            'https://globalcastaway.com/wp-content/uploads/2018/04/luxor-temple.jpg'),
    MyImage(
        imagePath:
            'https://touringinegypt.com/wp-content/uploads/2023/07/tomb-of-Ramesses-IV.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220.h,
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
