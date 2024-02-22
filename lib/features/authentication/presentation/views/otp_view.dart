import 'package:flutter/material.dart';
import 'package:store_app/features/authentication/presentation/views/widgets/otp_body.dart';

class OTPViev extends StatelessWidget {
  const OTPViev({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verificaion'),
      ),
      body: const OTPBody(),
    );
  }
}
