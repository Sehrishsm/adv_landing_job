


import 'package:adv_job_landing/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/on_boarding/presentation/views/onboarding_screen.dart';
import '../common/views/page_under_construction.dart';
import 'injection_container.dart';

Route<dynamic> generateRoutes(RouteSettings settings){
  switch(settings.name){
    case OnBoardingScreen.routeName:
      return _pageBuilder(
            (_) => BlocProvider(
              create: (_) => sl<OnBoardingCubit>(),
                child: const OnBoardingScreen(),), settings: settings,
      );
    default :
      return _pageBuilder((_) => PageUnderConstruction(), settings: settings);
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
    Widget Function(BuildContext) page,
    {required RouteSettings settings,}){
return PageRouteBuilder(
  settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child ,),
    pageBuilder:(context, _, __) => page(context),
);
}