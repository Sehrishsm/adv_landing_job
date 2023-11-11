import 'package:adv_job_landing/core/enums/update_user.dart';
import 'package:adv_job_landing/core/utils/typedefs.dart';
import 'package:adv_job_landing/src/auth/domain/entities/user.dart';

abstract class AuthRepo{
  const AuthRepo();

  ResultFuture<LocalUser> signIn(
  {
    required String email,
    required String password,

});

  ResultFuture<void> signUp({
    required String email,
    required String fullName,
    required String password,
});

  ResultFuture<void> forgetPassword(String email);

  ResultFuture<void> updateUser({
    required UpdateUserAction action,
    required dynamic userData,
});
}