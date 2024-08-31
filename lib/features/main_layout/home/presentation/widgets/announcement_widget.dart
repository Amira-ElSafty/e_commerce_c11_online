import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_c11_online/core/resources/assets_manager.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';

class AnnouncementWidget extends StatelessWidget {
  List<String> sliderImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3
  ];
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      initialPage: 0,
      indicatorColor: ColorManager.primaryDark,
      indicatorBackgroundColor: ColorManager.white,
      indicatorBottomPadding: 20.h,
      autoPlayInterval: 3000,
      isLoop: true,
      children: sliderImages
          .map((url) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          url,
          fit: BoxFit.fill,
          width: 210.w,
          height: 210.h,
        ),
      ))
          .toList(),
    );
  }
}
