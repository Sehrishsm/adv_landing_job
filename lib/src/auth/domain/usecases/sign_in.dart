import 'package:adv_job_landing/core/usecases/usecases.dart';
import 'package:adv_job_landing/core/utils/typedefs.dart';
import 'package:adv_job_landing/src/auth/domain/entities/user.dart';
import 'package:adv_job_landing/src/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

class SignIn extends UsecaseWithPrams<LocalUser, SignInParams>{
  const SignIn(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<LocalUser> call(SignInParams prams ) => _repo.signIn(
    email: prams.email,
    password: prams.password,
  );
}

class SignInParams extends Equatable{
  const SignInParams({
    required this.email,
    required this.password,
});
const SignInParams.empty()
  :email = '',
  password = ',';

final String email;
final String password;

  @override

  List<String> get props => [email, password];
}