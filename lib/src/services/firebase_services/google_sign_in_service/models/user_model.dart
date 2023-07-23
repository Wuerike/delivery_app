import 'package:delivery_app/src/features/domain/entities/user/user_entity.dart';
import 'package:delivery_app/src/utils/date/datetime_now_string_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

// TODO: Could be a direct mapper to UserEntitys
class UserModel {
  String? displayName;
  String? email;
  bool? emailVerified;
  bool? isAnonymous;
  String? phoneNumber;
  String? photoURL;
  String? refreshToken;
  String? tenantId;
  String? uid;
  String? idToken;

  UserModel(User? user, String? token) {
    displayName = user?.displayName;
    email = user?.email;
    emailVerified = user?.emailVerified;
    isAnonymous = user?.isAnonymous;
    phoneNumber = user?.phoneNumber;
    photoURL = user?.photoURL;
    refreshToken = user?.refreshToken;
    tenantId = user?.tenantId;
    uid = user?.uid;
    idToken = token;
  }

  UserEntity toUserEntity() {
    return UserEntity(
      userId: uid,
      role: UserRole.user.value(),
      username: displayName,
      email: email,
      phone: phoneNumber,
      dateOfBirth: "",
      startDate: DateTimeNowStringHelper.getDate(),
      photo: photoURL,
      shippingAddress: "",
      billingAddress: "",
      idToken: refreshToken,
    );
  }
}
