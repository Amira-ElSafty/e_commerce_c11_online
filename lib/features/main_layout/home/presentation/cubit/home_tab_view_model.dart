import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/get_all_brands_use_case.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/get_all_categories_use_case.dart';
import 'package:flutter_e_commerce_c11_online/features/main_layout/home/presentation/cubit/home_tab_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase ;

  HomeTabViewModel({required this.getAllCategoriesUseCase,
  required this.getAllBrandsUseCase})
      : super(HomeTabInitialState());

  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];

  void getAllCategories() async {
    emit(HomeCategoriesLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold((error) {
      emit(HomeCategoriesErrorState(failures: error));
    }, (response) {
        categoriesList = response.data!;
        emit(HomeCategoriesSuccessState(categoryResponseEntity: response));

    });
  }

  void getAllBrands() async {
    emit(HomeBrandsLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold((error) {
      emit(HomeBrandsErrorState(failures: error));
    }, (response) {
        brandsList = response.data!;
        emit(HomeBrandsSuccessState(brandsResponseEntity: response));
      }
    );
  }
}
