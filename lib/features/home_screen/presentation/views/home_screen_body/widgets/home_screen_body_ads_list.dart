import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app_route/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreenBodyAdsList extends StatelessWidget {
  HomeScreenBodyAdsList({
    super.key,
  });

  final List<String> ads = [
    AssetsManager.ad3,
    AssetsManager.ad2,
    AssetsManager.ad1,
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: ads.length,
      itemBuilder: (context, index, realIndex) {
        return Image.asset(ads[index]);
      },
      options: CarouselOptions(
        height: 200.h,
        autoPlay: true,
        scrollDirection: Axis.horizontal,
        viewportFraction: 0.8,
        initialPage: 0,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
      ),
    );
  }
}
