import 'package:adv_job_landing/core/enums/update_user.dart';
import 'package:adv_job_landing/core/usecases/usecases.dart';
import 'package:adv_job_landing/core/utils/typedefs.dart';
import 'package:adv_job_landing/src/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

class UpdateUser extends UsecaseWithPrams<void, UpdateUserParams>{
  const UpdateUser(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(UpdateUserParams params) => _repo.updateUser(
      action: params.action,
  userData: params.userData,
  );
}

class UpdateUserParams extends Equatable{
  const UpdateUserParams({
    required this.action,
    required this.userData,
});
 const UpdateUserParams.empty()
  : this(action: UpdateUserAction.displayName, userData: '',);

 final UpdateUserAction action;
 final dynamic userData;

  @override
  // TODO: implement props
  List<dynamic> get props =>[action, userData];
}
