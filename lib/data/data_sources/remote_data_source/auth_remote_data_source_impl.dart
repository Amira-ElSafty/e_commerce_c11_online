import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/data/api_manager.dart';
import 'package:flutter_e_commerce_c11_online/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:flutter_e_commerce_c11_online/data/end_points.dart';
import 'package:flutter_e_commerce_c11_online/data/model/RegisterResponseDM.dart';
import 'package:flutter_e_commerce_c11_online/domain/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        // internet
        var response = await apiManager.postData(EndPoints.register,
            body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone
        });
        var registerResponse = RegisterResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          return Right(registerResponse);
        }else{
          return Left(ServerError(errorMessage: registerResponse.message!));
        }
      } else {
        /// no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection, Please'
                'check internet connection'));
      }
    }catch(e){
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
