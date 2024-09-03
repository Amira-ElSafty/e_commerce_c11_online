import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/features/product_details/presentation/screen/product_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/routes_manager/routes.dart';

class ProductItemWidget extends StatelessWidget {
  ProductEntity productEntity;
  bool isWishlisted = false;
  ProductItemWidget({required this.productEntity});

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return "${words.sublist(0, 2).join(' ')}..";
    }
  }

  String truncateDescription(String description) {
    List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 4) {
      return description;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ProductDetails(productEntity: productEntity,);
        }));
      },
      child: Container(
        width: 191.w,
        height: 237.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: ColorManager.primaryDark,
            width: 1.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CachedNetworkImage(
                    imageUrl: productEntity.imageCover ?? '',
                    height: 128.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                      color: ColorManager.primaryDark,
                    )),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Positioned(
                  top: 5.h,
                  right: 2.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: IconButton(
                      color: ColorManager.primaryDark,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: isWishlisted == true
                          ? const Icon(Icons.favorite_rounded)
                          : const Icon(
                              Icons.favorite_border_rounded,
                            ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                productEntity.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.sp,
                      color: ColorManager.primaryDark,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Row(
                children: [
                  Text(
                    "EGP ${productEntity.price}",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 14.sp,
                          color: ColorManager.primaryDark,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
              child: Row(
                children: [
                  Text(
                    "Review (${productEntity.ratingsAverage})",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 14.sp,
                          color: ColorManager.primaryDark,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Icon(
                    Icons.star_rate_rounded,
                    color: ColorManager.starRateColor,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  InkWell(
                    onTap: () {
                      //todo: add to cart
                    },
                    splashColor: Colors.transparent,
                    child: Icon(
                      Icons.add_circle,
                      size: 32.sp,
                      color: ColorManager.primaryDark,
                    ),
                  )
                ],
              ),
            )
            // GridViewCardItemBody(
            //   productEntity: productEntity,
            // )
          ],
        ),
      ),
      // child: Container(
      //   width:  191.w,
      //   height: 250.h,
      //   decoration: BoxDecoration(
      //     border: Border.all(
      //       color: ColorManager.primary.withOpacity(0.3),
      //       width: 2.w,
      //     ),
      //     borderRadius: BorderRadius.circular(16.r),
      //   ),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       Expanded(
      //         flex: 5,
      //         child: Stack(
      //           alignment: AlignmentDirectional.center,
      //           children: [
      //             // Not working with the lastest flutter version
      //             CachedNetworkImage(
      //               imageUrl: productEntity.imageCover??'',
      //               height: 128.h,
      //               width: double.infinity,
      //               fit: BoxFit.cover,
      //               placeholder: (context, url) =>
      //                    Center(child: CircularProgressIndicator(
      //                     color: ColorManager.primaryDark,
      //                   )),
      //               errorWidget: (context, url, error) => const Icon(Icons.error),
      //             ),
      //             // ClipRRect(
      //             //   borderRadius:
      //             //       BorderRadius.vertical(top: Radius.circular(14.r)),
      //             //   child: Image.asset(
      //             //     image,
      //             //     fit: BoxFit.cover,
      //             //     width: width,
      //             //   ),
      //             // ),
      //             Positioned(
      //                 top: 8.h,
      //                 right:10.w,
      //                 child: HeartButton(onTap: () {})),
      //           ],
      //         ),
      //       ),
      //       Expanded(
      //         flex: 5,
      //         child: Padding(
      //           padding: const EdgeInsets.all(4),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 truncateTitle(productEntity.title??''),
      //                 style: getMediumStyle(
      //                   color: ColorManager.textColor,
      //                   fontSize: 14.sp,
      //                 ),
      //               ),
      //               SizedBox(height: 4.h),
      //               Text(
      //                 truncateDescription(productEntity.description??''),
      //                 style: getRegularStyle(
      //                   color: ColorManager.textColor,
      //                   fontSize: 14.sp,
      //                 ),
      //               ),
      //               SizedBox(height: 4.h),
      //               SizedBox(
      //                 width: 2.w,
      //                 child: Text(
      //                   "EGP ${productEntity.price}",
      //                   style: getRegularStyle(
      //                     color: ColorManager.textColor,
      //                     fontSize: 14.sp,
      //                   ),
      //                 ),
      //               ),
      //               // SizedBox(height: height * 0.005),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   SizedBox(
      //                     // width: width * 0.22,
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Text(
      //                           "Review (${productEntity.ratingsAverage})",
      //                           style: getRegularStyle(
      //                             color: ColorManager.textColor,
      //                             fontSize: 12.sp,
      //                           ),
      //                         ),
      //                         const Icon(
      //                           Icons.star_rate_rounded,
      //                           color: ColorManager.starRateColor,
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                   const Spacer(),
      //                   ClipRRect(
      //                     borderRadius: BorderRadius.circular(100),
      //                     child: InkWell(
      //                       onTap: () {},
      //                       child: Container(
      //                         height: 30.h,
      //                         width: 30.w,
      //                         decoration: BoxDecoration(
      //                           shape: BoxShape.circle,
      //                           color: ColorManager.primary,
      //                         ),
      //                         child: const Icon(
      //                           Icons.add,
      //                           color: Colors.white,
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
