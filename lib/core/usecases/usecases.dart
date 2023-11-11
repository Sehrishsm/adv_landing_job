
import 'package:adv_job_landing/core/utils/typedefs.dart';

abstract class UsecaseWithPrams<Type, Prams>{
const UsecaseWithPrams();

ResultFuture<Type> call(Prams prams);
}
abstract class UsecaseWithoutPrams<Type>{
  const UsecaseWithoutPrams();

  ResultFuture<Type> call();
}