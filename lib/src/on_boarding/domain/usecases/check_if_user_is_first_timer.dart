


import 'package:adv_job_landing/core/usecases/usecases.dart';
import 'package:adv_job_landing/core/utils/typedefs.dart';
import 'package:adv_job_landing/src/on_boarding/domain/repos/on_boarding_repo.dart';

class CheckIfUserIsFirstTimer extends UsecaseWithoutPrams<bool>{
  const CheckIfUserIsFirstTimer(this._repo);

  final OnBoardingRepo _repo;
  @override
  ResultFuture<bool> call() => _repo.checkIfUserIsFirstTimer();
}