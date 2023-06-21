import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerSlideshow extends StatefulWidget {
  const BannerSlideshow({super.key});

  @override
  _BannerSlideshowState createState() => _BannerSlideshowState();
}

class _BannerSlideshowState extends State<BannerSlideshow> {
  final List<String> _images = [
    'assets/images/banner_slider_1.png',
    'assets/images/banner_slider_2.png',
    'assets/images/banner_slider_3.png',
  ];
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 170,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.95,
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          items: _images.map((image) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              // child: Center(
              //   child: Text('Slide ${_images.indexOf(image) + 1}'),
              // ),
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          right: MediaQuery.of(context).size.width * 0.4,
          child: Row(
            children: _images.map((image) {
              int index = _images.indexOf(image);
              return Container(
                width: _currentPage == index ? 25 : 8,
                height: 5.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: _currentPage == index
                      ? Colors.white
                      : Colors.grey.shade700,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
