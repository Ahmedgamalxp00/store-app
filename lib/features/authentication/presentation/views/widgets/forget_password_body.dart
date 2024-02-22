import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/core/widgets/custom_botton.dart';
import 'package:store_app/features/authentication/presentation/views/widgets/custom_formfield.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Text(
              'Forget Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(26),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Please enter your email and we will send\nyou a link to return to your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.7,
                fontSize: getProportionateScreenWidth(15),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.16),
            CustomFormField(
              controller: emailController,
              lable: 'Email',
              hint: 'Enter your email',
              suffixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.16),
            CustomBotton(
              text: 'Coutinue',
              onPressed: () async {
                try {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: emailController.text);
                } catch (e) {
                  print('================================');
                  print(e.toString());
                }
              },
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account ?',
                  style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                ),
                TextButton(
                  onPressed: () {
                    context.push(AppRouter.kSignUp);
                  },
                  child: Text(
                    'Sign Up ',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: getProportionateScreenWidth(16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
