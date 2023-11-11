
import 'package:adv_job_landing/core/usecases/usecases.dart';
import 'package:adv_job_landing/core/utils/typedefs.dart';
import 'package:adv_job_landing/src/auth/domain/repos/auth_repo.dart';

class ForgotPassword extends UsecaseWithPrams<void, String>{
  const ForgotPassword(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(String prams) => _repo.forgetPassword(prams);
  
}