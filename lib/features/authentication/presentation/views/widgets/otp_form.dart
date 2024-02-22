import 'package:flutter/material.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/core/widgets/custom_botton.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin2FocusNode = FocusNode();
  FocusNode pin3FocusNode = FocusNode();
  FocusNode pin4FocusNode = FocusNode();
  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                height: getProportionateScreenHeight(80),
                child: TextFormField(
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                  style: TextStyle(fontSize: getProportionateScreenWidth(20)),
                  textAlign: TextAlign.center,
                  cursorColor: kTextColor,
                  keyboardType: TextInputType.number,
                  decoration: otpDecoration,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                height: getProportionateScreenHeight(80),
                child: TextFormField(
                  onChanged: (value) {
                    nextField(value, pin3FocusNode);
                  },
                  focusNode: pin2FocusNode,
                  style: TextStyle(fontSize: getProportionateScreenWidth(20)),
                  textAlign: TextAlign.center,
                  cursorColor: kTextColor,
                  keyboardType: TextInputType.number,
                  decoration: otpDecoration,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                height: getProportionateScreenHeight(80),
                child: TextFormField(
                  onChanged: (value) {
                    nextField(value, pin4FocusNode);
                  },
                  focusNode: pin3FocusNode,
                  style: TextStyle(fontSize: getProportionateScreenWidth(20)),
                  textAlign: TextAlign.center,
                  cursorColor: kTextColor,
                  keyboardType: TextInputType.number,
                  decoration: otpDecoration,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                height: getProportionateScreenHeight(80),
                child: TextFormField(
                  onChanged: (value) {
                    pin4FocusNode.unfocus();
                  },
                  focusNode: pin4FocusNode,
                  style: TextStyle(fontSize: getProportionateScreenWidth(20)),
                  textAlign: TextAlign.center,
                  cursorColor: kTextColor,
                  keyboardType: TextInputType.number,
                  decoration: otpDecoration,
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          const CustomBotton(text: 'Continue'),
        ],
      ),
    );
  }
}
