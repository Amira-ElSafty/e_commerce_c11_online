import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class CustomCategoryOrBrandWidget extends StatelessWidget {
  CategoryOrBrandEntity category ;
  CustomCategoryOrBrandWidget({required this.category});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 100,
          width: 100,
          fit: BoxFit.cover,
          imageUrl: category.image??'',
          placeholder: (context, url) =>
               Center(child: CircularProgressIndicator(
                color: ColorManager.primaryDark,
              )),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),

        // ClipRRect(
        //   borderRadius: BorderRadius.circular(100.r),
        //   child: Container(
        //     height: 100.h,
        //     width: 100.w,
        //     decoration: const BoxDecoration(
        //       shape: BoxShape.circle,
        //     ),
        //     child: Image.asset(
        //       ImageAssets.categoryHomeImage,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        SizedBox(height: 8.h),
        Text(
          category.name??'',
          style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
        ),
      ],
    );
  }
}
