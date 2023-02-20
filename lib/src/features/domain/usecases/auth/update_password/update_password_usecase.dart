import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/features/data/repositories/auth/update_password/update_password_repository.dart';

abstract class UpdatePasswordUsecaseAbstraction {
  Future<void> execute({required String email});
}

class UpdatePasswordUsecase extends UpdatePasswordUsecaseAbstraction {
  final UpdatePasswordRepositoryAbstraction updatePasswordRepository;

  UpdatePasswordUsecase({UpdatePasswordRepositoryAbstraction? updatePasswordRepository})
      : updatePasswordRepository = updatePasswordRepository ?? UpdatePasswordRepository();

  @override
  Future<void> execute({required String email}) async {
    await updatePasswordRepository.updatePassword(email: email);
  }
}
