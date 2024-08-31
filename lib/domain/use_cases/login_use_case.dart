import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/domain/entities/LoginResponseEntity.dart';
import 'package:flutter_e_commerce_c11_online/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../entities/RegisterResponseEntity.dart';
import '../failures.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<Either<Failures, LoginResponseEntity>> invoke(String email,
      String password){
    return authRepository.login(email, password);
  }
}
