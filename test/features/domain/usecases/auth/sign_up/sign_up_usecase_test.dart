import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/features/data/repositories/auth/sign_up/sign_up_params.dart';
import 'package:delivery_app/src/features/domain/entities/auth/sign_up_entity.dart';
import 'package:delivery_app/src/features/domain/entities/user/user_entity.dart';
import 'package:delivery_app/src/features/domain/usecases/auth/sign_up/sign_up_usecase.dart';
import 'package:delivery_app/src/features/domain/usecases/auth/sign_up/sign_up_usecase_params.dart';
import 'package:delivery_app/src/features/domain/usecases/user/save_user/save_user_usecase.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

abstract class _Constants {
  static String correctEmail = "correct@email.com";
  static String correctPass = "correct_pass";
}

class SignUpRepositoryMock extends Mock implements SignUpRepositoryAbstraction {}

class SaveUserUsecaseMock extends Mock implements SaveUserUsecaseAbstraction {}

class SignUpParamseMock extends Mock implements SignUpParams {}

class UserEntityMock extends Mock implements UserEntity {}

void main() {
  late SignUpRepositoryAbstraction signUpRepository;
  late SaveUserUsecaseAbstraction saveUserUsecase;
  late SignUpUsecase signUpUsecase;

  setUpAll(() {
    registerFallbackValue(SignUpParamseMock());
    registerFallbackValue(UserEntityMock());
  });

  setUp(() {
    signUpRepository = SignUpRepositoryMock();
    saveUserUsecase = SaveUserUsecaseMock();

    signUpUsecase = SignUpUsecase(
      signUpRepository: signUpRepository,
      saveUserUsecase: saveUserUsecase,
    );
  });

  final params = SignUpUsecaseParams(
    username: 'any-name',
    email: _Constants.correctEmail,
    password: _Constants.correctPass,
  );

  group('Test signUp usecase succeeds', () {
    test('Test signUp when repository and saveUser usecase succeeds', () async {
      // Arrange
      when(() {
        return signUpRepository.signUp(params: any<SignUpParams>(named: "params"));
      }).thenAnswer((_) async {
        return Future.value(Result.success(SignUpEntity(email: _Constants.correctEmail)));
      });

      when(() {
        return saveUserUsecase.execute(user: any<UserEntity>(named: "user"));
      }).thenAnswer((_) async {
        return Future.value(Result.success(UserEntity()));
      });

      // // Act
      final result = await signUpUsecase.execute(params: params);

      // Assert
      expect(result.value, isA<SignUpEntity>());
      expect(result.value?.email, _Constants.correctEmail);
    });
  });

  group('Test signUp usecase fails', () {
    test('Test signUp when repository fails', () async {
      // Arrange
      const message = "any error message from repository";

      when(() {
        return signUpRepository.signUp(params: any<SignUpParams>(named: "params"));
      }).thenAnswer((_) async {
        return Future.value(Result.failure(Failure.fromMessage(message: message)));
      });

      when(() {
        return saveUserUsecase.execute(user: any<UserEntity>(named: "user"));
      }).thenAnswer((_) async {
        return Future.value(Result.success(UserEntity()));
      });

      // // Act
      final result = await signUpUsecase.execute(params: params);

      // Assert
      expect(result.value, isNull);
      expect(result.status, ResultStatus.error);
      expect(result.error!.message, message);
    });

    test('Test signUp when repository fails', () async {
      // Arrange
      const message = "any error message from saveUserUsecase";

      when(() {
        return signUpRepository.signUp(params: any<SignUpParams>(named: "params"));
      }).thenAnswer((_) async {
        return Future.value(Result.success(SignUpEntity(email: _Constants.correctEmail)));
      });

      when(() {
        return saveUserUsecase.execute(user: any<UserEntity>(named: "user"));
      }).thenAnswer((_) async {
        return Future.value(Result.failure(Failure.fromMessage(message: message)));
      });

      // // Act
      final result = await signUpUsecase.execute(params: params);

      // Assert
      expect(result.value, isNull);
      expect(result.status, ResultStatus.error);
      expect(result.error!.message, message);
    });
  });
}
