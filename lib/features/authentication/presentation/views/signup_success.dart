import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/core/widgets/custom_botton.dart';

class SignupSuccessView extends StatelessWidget {
  const SignupSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up Success')),
      body: SizedBox(
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset('assets/images/success.png'),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    'Sign Up Success',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(26),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    'We sent a verification link to your email \n press the link then log in with your new account ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: CustomBotton(
                text: 'Log In',
                onPressed: () {
                  context.go(AppRouter.kSignIn);
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
