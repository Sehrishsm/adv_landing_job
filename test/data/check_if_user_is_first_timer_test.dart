import 'package:adv_job_landing/src/on_boarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../on_boarding/on_boarding_repo_mock.dart';

void main() {
  late MockOnBoardingRepo repo;
  late CheckIfUserIsFirstTimer usecase;

  setUp(() {
    repo = MockOnBoardingRepo();
    usecase = CheckIfUserIsFirstTimer(repo);
  });

  test(
    'should call the [OnBoardingRepo.cacheFirstTimer] '
        'and return the right data',
        () async {
      when(() => repo.checkIfUserIsFirstTimer()).thenAnswer(
            (_) async => Right(
         true
        ),
      );
      final result = await usecase();
      expect(
        result,
        equals(
         Right<dynamic, bool>(true)));
      verify(() => repo.checkIfUserIsFirstTimer()).called(1);
      verifyNoMoreInteractions(repo);
    },
  );
}
