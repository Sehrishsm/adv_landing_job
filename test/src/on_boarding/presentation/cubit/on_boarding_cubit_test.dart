import 'package:adv_job_landing/core/errors/failure.dart';
import 'package:adv_job_landing/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:adv_job_landing/src/on_boarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:adv_job_landing/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class MockCacheFirstTimer extends Mock implements CacheFirstTimer{}

class MockCheckIfUserIsFirstTimer extends Mock implements CheckIfUserIsFirstTimer{}

void main(){
  late CacheFirstTimer cacheFirstTimer;
  late CheckIfUserIsFirstTimer checkIfUserIsFirstTimer;
  late OnBoardingCubit cubit;
  
  setUp(() {
 cacheFirstTimer = MockCacheFirstTimer();
 checkIfUserIsFirstTimer = MockCheckIfUserIsFirstTimer();
 cubit = OnBoardingCubit(cacheFirstTimer: cacheFirstTimer,
     checkIfUserIsFirstTimer: checkIfUserIsFirstTimer,);
  });
  final tFailure =  CacheFailure(
    message: 'Insufficient storage Permission',
    statusCode:4032, );
  test('initial state should be [OnboardingInitial]', () {
    expect(cubit.state, const OnBoardingInitial(),);
  });
  
  group('cacheFirstTimer', () {
  blocTest<OnBoardingCubit, OnBoardingState>(
    'should emit [CachingFirstTimer, UserCached] when successful',
    build: () {
      when(()=> cacheFirstTimer()).thenAnswer((_) async => const Right(null),);
      return cubit;
    },
    act: (cubit) => cubit.cacheFirstTimer(),
    expect: () => const[
      CachingFirstTimer(),
      UserCached(),
    ],
    verify: (_){
      verify(()=> cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(cacheFirstTimer);
    },
  );

  blocTest<OnBoardingCubit, OnBoardingState>('should emit '
 '[CachingFirstTimer, OnboardingError] when unsuccessful' ,
  build: (){
    when(()=> cacheFirstTimer()).thenAnswer(
            (_) async=> Left(tFailure,),
    );
    return cubit;
  },
    act: (cubit)=> cubit.cacheFirstTimer(),
    expect: ()=> [
      const CachingFirstTimer(),
      OnboardingError(tFailure.errorMessage),
    ],
    verify: (_){
      verify(()=> cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(cacheFirstTimer);
    },
  );
  });
 group('checkIfUserIsFirstTimer', () {
blocTest<OnBoardingCubit, OnBoardingState>('should emit [CheckingIfUserIsFirstTimer,'
    ' OnBoardingStatus] '
    'when successful',
    build: (){
 when(()=> checkIfUserIsFirstTimer()).thenAnswer(
         (_)async => const Right(false),);
 return cubit;
    },

  act: (cubit) => cubit.checkIfUserIsFirstTimer(),
  expect: ()=>const[
    CheckingIfUserIsFirstTimer(),
    OnBoardingStatus(isFirstTimer: false),
  ],

  verify: (_){
  verify(()=> checkIfUserIsFirstTimer()).called(1);
  verifyNoMoreInteractions(checkIfUserIsFirstTimer);
  }
);
blocTest<OnBoardingCubit, OnBoardingState>(
  'should emit [CheckingIfUserIsFirstTimer, OnBoardingState[true] when '
      'unsuccessful',
  build: (){
    when(()=> checkIfUserIsFirstTimer()).thenAnswer((_)async =>Left(tFailure));
    return cubit;
  },
    act: (cubit) => cubit.checkIfUserIsFirstTimer(),
    expect: ()=>const [
      CheckingIfUserIsFirstTimer(),
      OnBoardingStatus(isFirstTimer: true),
    ],

    verify: (_) {
      verify(() => checkIfUserIsFirstTimer()).called(1);
      verifyNoMoreInteractions(checkIfUserIsFirstTimer);
    },);
 });
}