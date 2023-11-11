import 'package:adv_job_landing/core/usecases/usecases.dart';
import 'package:adv_job_landing/core/utils/typedefs.dart';
import 'package:adv_job_landing/src/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

class SignUp extends  UsecaseWithPrams <void, SignUpParams>{

  const SignUp(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(SignUpParams prams)=> _repo.signUp(
      email: prams.email,
      fullName: prams.fullName,
      password: prams.password,);
  }

class SignUpParams extends Equatable{
  const SignUpParams({
  required this.email,
    required this.fullName,
    required this.password,
});
  const SignUpParams.empty():
      this(email: '',
      password: '',
      fullName: '',
      );
  final String email;
  final String password;
  final String fullName;

  @override

  List<String> get props => [email,password, fullName];
}


