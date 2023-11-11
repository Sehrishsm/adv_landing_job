import 'package:adv_job_landing/core/common/widget/gradient_background.dart';
import 'package:adv_job_landing/core/res/media_res.dart';
import 'package:flutter/material.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
       img: MediaRes.gradientBg,
        child: SafeArea(
          child: Center(child: Text('page under construction'),),
        ),
      ),
    );
  }
}
