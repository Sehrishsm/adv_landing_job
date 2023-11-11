import 'package:adv_job_landing/core/errors/exception.dart';
import 'package:adv_job_landing/core/errors/failure.dart';
import 'package:adv_job_landing/core/utils/typedefs.dart';
import 'package:adv_job_landing/src/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:dartz/dartz.dart';

import '../datasources/on_boarding_local_data_source.dart';

class OnBoardingRepoImpl implements OnBoardingRepo{

  const OnBoardingRepoImpl(this._localDataSource);


  final OnBoardingLocalDataSource _localDataSource;
  @override
  ResultFuture<void> cacheFirstTimer() async{
    try{
      await _localDataSource.catchFirstTimer();
      return Right(null);
    } on CacheException catch(e){
     return Left( CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> checkIfUserIsFirstTimer()async {
    try{
   final result =await _localDataSource.CheckIfUserIsFirstTimer();
   return Right(result);
    }on CacheException catch(e){
      return Left( CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

}