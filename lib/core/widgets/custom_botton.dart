import 'package:flutter/material.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/size_config.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kPrimaryColor,
      ),
      height: getProportionateScreenHeight(56),
      width: double.infinity,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
