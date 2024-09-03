import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/features/main_layout/cubit/home_states.dart';
import 'package:flutter_e_commerce_c11_online/features/products_screen/presentation/screens/products_screen.dart';

import '../categories/presentation/categories_tab.dart';
import '../favourite/presentation/favourite_screen.dart';
import '../home/presentation/home_tab.dart';
import '../profile_tab/presentation/profile_tab.dart';

class HomeViewModel extends Cubit<HomeStates>{
  HomeViewModel():super(HomeInitialState());
  //todo: hold data - handle logic
  int currentIndex = 0;
  List<Widget> tabs = [
     HomeTab(),
    const ProductsScreen(),
    const FavouriteScreen(),
    const ProfileTab(),
  ];
  void changeSelectedIndex(int selectedIndex) {
    emit(HomeInitialState());
    currentIndex = selectedIndex ;
    emit(ChangeSelectedIndexState());
  }
}