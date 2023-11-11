
import 'package:adv_job_landing/core/usecases/usecases.dart';
import 'package:adv_job_landing/core/utils/typedefs.dart';
import 'package:adv_job_landing/src/on_boarding/domain/repos/on_boarding_repo.dart';

class CacheFirstTimer extends UsecaseWithoutPrams<void> {
const CacheFirstTimer(this._repo);

final OnBoardingRepo _repo;

@override
  ResultFuture<void> call() async => _repo.cacheFirstTimer();
}