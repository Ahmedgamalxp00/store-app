import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/features/authentication/presentation/controllers/signin_cubit/signin_cubit.dart';
import 'package:store_app/features/authentication/presentation/views/widgets/signup_form.dart';
import 'package:store_app/features/authentication/presentation/views/widgets/social_card.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Text(
              'Register Account',
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
              'Complite your details or continue \n with social media ',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.7,
                fontSize: getProportionateScreenWidth(15),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            //
            const SignUpForm(), //Sign up form

            //
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(
                  ontap: () {
                    BlocProvider.of<SigninCubit>(context).signInWithGoogle();
                  },
                  image: 'assets/icons/google-icon.svg',
                ),
                const SizedBox(width: 10),
                SocialCard(
                  ontap: () {
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
                  'By continuing you confirm that you agree\nwith our terms and conditions',
                  style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                  textAlign: TextAlign.center,
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
