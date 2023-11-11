import 'package:adv_job_landing/core/errors/failure.dart';
import 'package:adv_job_landing/src/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:adv_job_landing/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../on_boarding/on_boarding_repo_mock.dart';

void main() {
  late OnBoardingRepo repo;
  late CacheFirstTimer usecase;

  setUp(() {
    repo = MockOnBoardingRepo();
    usecase = CacheFirstTimer(repo);
  });

  test(
    'should call the [OnBoardingRepo.cacheFirstTimer]'
    'and return the right data',
    () async {
      //arrange
      when(() => repo.cacheFirstTimer()).thenAnswer(
        (_) async => Left(
          ServerFailure(
            message: 'Unknown error occurred',
            statusCode: 500,
          ),
        ),
      );
      final result = await usecase();
      // assert
      expect(
        result,
        equals(
          Left<Failure, dynamic>(
            ServerFailure(message: 'Unknown error occurred', statusCode: 500,
            ),
          ),
        ),
      );
      verify(() => repo.cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(repo);
    },
  );
}
