import 'package:adv_job_landing/core/enums/update_user.dart';
import 'package:adv_job_landing/core/errors/exception.dart';
import 'package:adv_job_landing/core/errors/failure.dart';
import 'package:adv_job_landing/core/utils/typedefs.dart';
import 'package:adv_job_landing/src/auth/domain/entities/user.dart';
import 'package:adv_job_landing/src/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../datasources/auth_remote_data_source.dart';

class AuthRepoImpl implements AuthRepo{

  const AuthRepoImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;
  @override

  ResultFuture<void> forgetPassword (String email)async{
    try{
      await _remoteDataSource.forgotPassword(email);
    return const Right(null);
  } on ServerException catch(e){
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
}
@override
  ResultFuture<LocalUser>signIn({
    required String email,
  required String password,
})async{
try{
  final result = await _remoteDataSource.signIn(
    email:email,
    password:password,
  );
  return Right(result);
} on ServerException catch(e){
  return Left(ServerFailure(message: e.message, statusCode: e.statusCode,));
}
}
@override

ResultFuture<void>signUp({
  required String email,
  required String fullName,
  required String password,
})async{
  try{
 await _remoteDataSource.signUp(
      email:email,
      fullName:fullName,
      password:password,
    );
    return const Right(null);
  } on ServerException catch(e){
    return Left(ServerFailure(message: e.message, statusCode: e.statusCode,));
  }
}

@override
  ResultFuture<void>updateUser({
    required UpdateUserAction action,
  required dynamic userData,
})async{
try{
  await _remoteDataSource.updateUser(action:action, userData:userData);
  return const Right(null);
}on ServerException catch(e){
  return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
}
}
}