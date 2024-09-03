import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/core/resources/color_manager.dart';
import 'package:flutter_e_commerce_c11_online/features/products_screen/presentation/cubit/product_screen_states.dart';
import 'package:flutter_e_commerce_c11_online/features/products_screen/presentation/cubit/product_screen_view_model.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../widgets/custom_product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<ProductScreenViewModel, ProductScreenStates>(
      bloc: ProductScreenViewModel.get(context)..getAllProducts(),
      builder: (context, state) {
        if (state is ProductSuccessState) {
          return Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: ProductScreenViewModel.get(context).productsList.length ,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 7 / 9,
                    ),
                    itemBuilder: (context, index) {
                      return ProductItemWidget(
                          productEntity: ProductScreenViewModel.get(context).productsList[index]);
                    },
                    scrollDirection: Axis.vertical,
                  ),
                )
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: ColorManager.primaryDark,
            ),
          );
        }
      },
    );
  }
}
