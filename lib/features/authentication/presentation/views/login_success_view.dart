import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/core/widgets/custom_botton.dart';

class LoginSuccessView extends StatelessWidget {
  const LoginSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Success')),
      body: SizedBox(
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset('assets/images/success.png'),
            const Spacer(),
            Text(
              'Login Success',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(26),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: CustomBotton(
                text: 'Back to home',
                onPressed: () {
                  context.push(AppRouter.kMainView);
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
