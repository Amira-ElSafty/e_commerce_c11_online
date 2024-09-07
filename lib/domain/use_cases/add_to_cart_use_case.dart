import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce_c11_online/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/AddToCartResponseEntity.dart';
import '../failures.dart';

@injectable
class AddToCartUseCase {
  HomeRepository homeRepository;

  AddToCartUseCase({required this.homeRepository});

  Future<Either<Failures, AddToCartResponseEntity>> invoke(String productId) {
    return homeRepository.addToCart(productId);
  }
}
