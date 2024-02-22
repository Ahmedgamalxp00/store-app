import 'package:flutter/material.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/features/splash/presentation/views/widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
