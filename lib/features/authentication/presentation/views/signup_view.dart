import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/features/authentication/presentation/controllers/signin_cubit/signin_cubit.dart';
import 'package:store_app/features/authentication/presentation/controllers/signup_cubit/signup_cubit.dart';
import 'package:store_app/features/authentication/presentation/views/widgets/signup_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          context.push(AppRouter.kLoginSuccess);
        } else if (state is SigninFailure) {
        } else if (state is SigninLoading) {
          print('loading ..............................');
        }
      },
      builder: (context, state) {
        return BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccess) {
              context.push(AppRouter.kSignupSuccess);
            } else if (state is SignupFailure) {
            } else if (state is SignupLoading) {
              print('loading ..............................');
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Sign Up'),
              ),
              body: state is SignupLoading
                  ? const SpinKitPianoWave(
                      color: kPrimaryColor,
                      size: 50.0,
                    )
                  : const SignUpBody(),
            );
          },
        );
      },
    );
  }
}
