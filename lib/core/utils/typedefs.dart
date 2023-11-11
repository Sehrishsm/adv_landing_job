
import 'package:adv_job_landing/core/errors/failure.dart';
import 'package:dartz/dartz.dart';



typedef ResultFuture<T> = Future<Either<Failure,T>>;

typedef DataMap = Map<String, dynamic>;