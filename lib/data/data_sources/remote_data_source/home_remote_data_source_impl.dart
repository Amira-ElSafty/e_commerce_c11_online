import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_e_commerce_c11_online/data/api_manager.dart';
import 'package:flutter_e_commerce_c11_online/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:flutter_e_commerce_c11_online/data/model/CategoryOrBrandResponseDto.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../../end_points.dart';
import '../../model/ProductResponseDto.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>>
      getAllCategories() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        // internet
        var response = await apiManager.getData(EndPoints.getAllCategories);
        var getAllCategoriesResponse =
            CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          return Right(getAllCategoriesResponse);
        } else {
          return Left(
              ServerError(errorMessage: getAllCategoriesResponse.message!));
        }
      } else {
        /// no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection, Please'
                'check internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllBrands() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        // internet
        var response = await apiManager.getData(EndPoints.getAllBrands);
        var getAllBrandsResponse =
            CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          return Right(getAllBrandsResponse);
        } else {
          return Left(ServerError(errorMessage: getAllBrandsResponse.message!));
        }
      } else {
        /// no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection, Please'
                'check internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductResponseDto>> getAllProducts()async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        // internet
        var response = await apiManager.getData(EndPoints.getAllProducts);
        var getAllProductsResponse =
        ProductResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          return Right(getAllProductsResponse);
        } else {
          return Left(ServerError(errorMessage: getAllProductsResponse.message!));
        }
      } else {
        /// no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection, Please'
                'check internet connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
