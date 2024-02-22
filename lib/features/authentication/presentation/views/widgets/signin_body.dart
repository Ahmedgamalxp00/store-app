import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/features/authentication/presentation/controllers/signin_cubit/signin_cubit.dart';
import 'package:store_app/features/authentication/presentation/views/widgets/signin_form.dart';
import 'package:store_app/features/authentication/presentation/views/widgets/social_card.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Text(
              'Welcome Back',
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
              'Sign in with your email and password \n or continue with social media ',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.7,
                fontSize: getProportionateScreenWidth(15),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            const SignInForm(),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(
                  image: 'assets/icons/google-icon.svg',
                  ontap: () async {
                    BlocProvider.of<SigninCubit>(context).signInWithGoogle();
                  },
                ),
                const SizedBox(width: 10),
                SocialCard(
                  ontap: () async {
                    BlocProvider.of<SigninCubit>(context).signInWithFacebook();
                  },
                  image: 'assets/icons/facebook-2.svg',
                ),
                const SizedBox(width: 10),
                const SocialCard(
                  image: 'assets/icons/twitter.svg',
                ),
              ],
            ),
            const SizedBox(height: 20),
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
