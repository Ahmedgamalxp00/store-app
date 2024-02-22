import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:store_app/features/authentication/presentation/controllers/signin_cubit/signin_cubit.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninCubit, SigninState>(
      builder: (context, state) {
        String name = BlocProvider.of<SigninCubit>(context).userName;
        String email = BlocProvider.of<SigninCubit>(context).email;
        return Column(
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 20),
            ),
            const Gap(5),
            Text(email),
          ],
        );
      },
    );
  }
}
