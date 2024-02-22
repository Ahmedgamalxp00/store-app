import 'package:flutter/material.dart';
import 'package:store_app/core/constants.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.lable,
    required this.hint,
    required this.suffixIcon,
    required this.keyboardType,
    this.validator,
    this.onChanged,
    this.obscureText = false,
    this.onsave,
    this.onSuffixTap,
    this.controller,
  });
  final String lable, hint;
  final IconData suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String?)? onsave;
  final Function(String?)? onChanged;
  final Function()? onSuffixTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      onSaved: onsave,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: Colors.black,
      cursorHeight: 20,
      decoration: InputDecoration(
        suffixIconColor: kPrimaryColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: const TextStyle(fontSize: 22),
        label: Text(
          lable,
          style: const TextStyle(fontSize: 22, color: kTextColor),
        ),
        hintText: hint,
        // hintStyle: TextStyle(color: kSecondaryColor.withOpacity(0.7)),
        border: myBorder(),
        enabledBorder: myBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(30),
          gapPadding: 15,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: onSuffixTap,
            child: Icon(
              suffixIcon,
              size: 30,
            ),
          ),
        ),
      ),
      style: const TextStyle(color: kTextColor, fontSize: 17),
    );
  }
}
