import 'package:flutter/material.dart';
import 'package:store_app/features/authentication/presentation/views/widgets/forget_password_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: const ForgetPasswordBody(),
    );
  }
}
