import 'package:adv_job_landing/core/errors/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract class OnBoardingLocalDataSource{
  const OnBoardingLocalDataSource();

  Future<void> catchFirstTimer();
  Future<bool> CheckIfUserIsFirstTimer();
}

const kFirstTimerKey = 'first timer';

class OnBoardingLocalDataSrcImpl extends OnBoardingLocalDataSource{

  const OnBoardingLocalDataSrcImpl(this._prefs);

  final SharedPreferences _prefs ;

  @override
  Future<bool> CheckIfUserIsFirstTimer()async {
try{
  return _prefs.getBool(kFirstTimerKey) ?? true;
}catch(e){
  throw CacheException(message: e.toString());
}
  }

  @override
  Future<void> catchFirstTimer()async {
 try{
   await _prefs.setBool(kFirstTimerKey, false);
 }catch(e){
   throw CacheException(message: e.toString());
 }

  }

}