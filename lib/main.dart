import 'package:adv_job_landing/core/res/colors.dart';
import 'package:adv_job_landing/core/res/font.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/services/injection_container.dart';
import 'core/services/routes.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Education App',
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: Fonts.poppins,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
        ),
        colorScheme: ColorScheme.fromSwatch(
            accentColor: CustomColors.primaryColor,),
      ),
     onGenerateRoute: generateRoutes,
    );
  }
}


