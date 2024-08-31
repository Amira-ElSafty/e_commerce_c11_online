import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/core/resources/color_manager.dart';
import 'package:flutter_e_commerce_c11_online/features/main_layout/home/presentation/cubit/home_tab_states.dart';
import 'package:flutter_e_commerce_c11_online/features/main_layout/home/presentation/cubit/home_tab_view_model.dart';
import 'package:flutter_e_commerce_c11_online/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../di/di.dart';
import 'widgets/announcement_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel..getAllCategories()..getAllBrands(),
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              AnnouncementWidget(),
              SizedBox(
                height: 20.h,
              ),
              CustomSectionBar(sectionNname: 'Categories', function: () {}),
              // viewModel.categoriesList.isEmpty?
              // Center(
              //   child: CircularProgressIndicator(
              //     color: ColorManager.primaryDark,
              //   ),
              // ):
              // SizedBox(
              //   height: 270.h,
              //   child: GridView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       return const CustomCategoryWidget();
              //     },
              //     itemCount: 20,
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //     ),
              //   ),
              // )
              state is HomeCategoriesSuccessState
                  ? SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomCategoryOrBrandWidget(
                            category: viewModel.categoriesList[index],
                          );
                        },
                        itemCount: viewModel.categoriesList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primaryDark,
                      ),
                    ),
              SizedBox(height: 12.h),
              CustomSectionBar(sectionNname: 'Brands', function: () {}),
              state is HomeCategoriesLoadingState
                  ? Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primaryDark,
                      ),
                    )
                  : SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomCategoryOrBrandWidget(
                              category: viewModel.brandsList[index]);
                        },
                        itemCount: viewModel.brandsList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      ),
                    ),
              // CustomSectionBar(
              //   sectionNname: 'Most Selling Products',
              //   function: () {},
              // ),
              // SizedBox(
              //   child: SizedBox(
              //     height: 360.h,
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return const ProductCard(
              //           title: "Nike Air Jordon",
              //           description:
              //               "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
              //           rating: 4.5,
              //           price: 1100,
              //           priceBeforeDiscound: 1500,
              //           image: ImageAssets.categoryHomeImage,
              //         );
              //       },
              //       itemCount: 20,
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
