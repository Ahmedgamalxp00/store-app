import 'package:flutter/material.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/features/authentication/presentation/views/widgets/otp_form.dart';

class OTPBody extends StatelessWidget {
  const OTPBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Text(
              'OTP Verificaion',
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
              'We sent you code to +20 0102*****20',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.7,
                fontSize: getProportionateScreenWidth(15),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'this code will expired in  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.7,
                    fontSize: getProportionateScreenWidth(15),
                  ),
                ),
                TweenAnimationBuilder(
                  tween: Tween(begin: 30.0, end: 0),
                  duration: const Duration(seconds: 30),
                  builder: (context, value, child) => Text(
                    "00:${value.toInt()}",
                    style: TextStyle(
                      color: kPrimaryColor,
                      height: 1.7,
                      fontSize: getProportionateScreenWidth(15),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.15),
            const OtpForm(),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Text(
              'Resend OTP code',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: getProportionateScreenWidth(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
