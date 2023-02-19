import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository extends LocalStorageRepositoryAbstraction {
  final Future<SharedPreferences> sharedPreferences;

  LocalStorageRepository({Future<SharedPreferences>? sharedPreferences})
      : sharedPreferences = sharedPreferences ?? SharedPreferences.getInstance();

  @override
  Future<Result<bool, Failure>> save({required String key, required String value}) async {
    try {
      final prefs = await sharedPreferences;
      final result = await prefs.setString(key, value);
      return Result.success(result);
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }

  @override
  Future<Result<String, Failure>> get({required String key}) async {
    try {
      return sharedPreferences.then((prefs) {
        return Result.success(prefs.getString(key));
      });
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }

  @override
  Future<Result<bool, Failure>> remove({required String key}) async {
    try {
      final prefs = await sharedPreferences;
      final result = await prefs.remove(key);
      return Result.success(result);
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}
