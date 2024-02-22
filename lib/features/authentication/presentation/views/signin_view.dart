import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/features/authentication/presentation/controllers/signin_cubit/signin_cubit.dart';
import 'package:store_app/features/authentication/presentation/views/widgets/signin_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sign In'),
          ),
          body: state is SigninLoading
              ? const SpinKitPianoWave(
                  color: kPrimaryColor,
                  size: 50.0,
                )
              : const SignInBody(),
        );
      },
    );
  }
}
