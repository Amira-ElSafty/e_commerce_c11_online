import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/domain/use_cases/login_use_case.dart';
import 'package:flutter_e_commerce_c11_online/features/auth/presentation/screens/sign_in/cubit/sign_in_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  var emailController = TextEditingController(text: 'amira111@route.com');
  var passwordController = TextEditingController(text: 'Amira123');

  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());

  //todo: hold data - handle logic

  void login() async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
      emailController.text,
      passwordController.text,
    );
    either.fold((l) {
      emit(LoginErrorState(failures: l));
    }, (response) {
      emit(LoginSuccessState(responseEntity: response));
    });
  }
}
