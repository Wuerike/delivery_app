import 'package:delivery_app/src/features/domain/usecases/auth/sign_in/sign_in_usecase_params.dart';

class SignInModel {
  SignInModel({this.email, this.password});

  String? email;
  String? password;

  SignInUsecaseParams toSignInUsecaseParams() {
    return SignInUsecaseParams(
      email: email ?? "",
      password: password ?? "",
    );
  }
}
