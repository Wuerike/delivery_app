import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';

abstract class UpdatePasswordAbstraction {
  Future<void> execute({required String email});
}

class UpdatePassword extends UpdatePasswordAbstraction {
  final UpdatePasswordRepositoryAbstraction _updatePasswordRepository;

  UpdatePassword(UpdatePasswordRepositoryAbstraction updatePasswordRepository)
      : _updatePasswordRepository = updatePasswordRepository;

  @override
  Future<void> execute({required String email}) async {
    await _updatePasswordRepository.updatePassword(email: email);
  }
}
