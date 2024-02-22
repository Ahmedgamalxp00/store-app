import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/core/widgets/custom_botton.dart';
import 'package:store_app/features/authentication/presentation/controllers/signin_cubit/signin_cubit.dart';
import 'package:store_app/features/authentication/presentation/views/widgets/custom_formfield.dart';
import 'package:store_app/features/authentication/presentation/views/widgets/form_erorr.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final List<String> erorrList = [];
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    final List<String> fireBaseErorrList =
        BlocProvider.of<SigninCubit>(context).erorrList;
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomFormField(
              controller: emailController,
              onChanged: (value) {
                if (value == null ||
                    value.isNotEmpty && erorrList.contains(kEmailNullError)) {
                  setState(() {
                    erorrList.remove(kEmailNullError);
                  });
                } else if (emailValidatorRegExp.hasMatch(value) &&
                    erorrList.contains(kInvalidEmailError)) {
                  setState(() {
                    erorrList.remove(kInvalidEmailError);
                  });
                } else if (fireBaseErorrList.contains(kErorr)) {
                  setState(() {
                    fireBaseErorrList.remove(kErorr);
                  });
                } else if (fireBaseErorrList.contains(kSignInErorr)) {
                  setState(() {
                    fireBaseErorrList.remove(kSignInErorr);
                  });
                }

                return null;
              },
              validator: (value) {
                if (value == null ||
                    value.isEmpty && !erorrList.contains(kEmailNullError)) {
                  setState(() {
                    erorrList.add(kEmailNullError);
                  });
                } else if (value.isNotEmpty &&
                    !emailValidatorRegExp.hasMatch(value) &&
                    !erorrList.contains(kInvalidEmailError)) {
                  setState(() {
                    erorrList.add(kInvalidEmailError);
                  });
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              suffixIcon: Icons.mail_outline,
              hint: 'Enter your Email',
              lable: 'Email',
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            CustomFormField(
              controller: passController,
              obscureText: true,
              onChanged: (value) {
                if (value == null ||
                    value.isNotEmpty && erorrList.contains(kPassNullError)) {
                  setState(() {
                    erorrList.remove(kPassNullError);
                  });
                } else if (value.length >= 8 &&
                    erorrList.contains(kShortPassError)) {
                  setState(() {
                    erorrList.remove(kShortPassError);
                  });
                } else if (fireBaseErorrList.contains(kErorr)) {
                  setState(() {
                    fireBaseErorrList.remove(kErorr);
                  });
                } else if (fireBaseErorrList.contains(kSignInErorr)) {
                  setState(() {
                    fireBaseErorrList.remove(kSignInErorr);
                  });
                }
                return null;
              },
              validator: (value) {
                if (value == null ||
                    value.isEmpty && !erorrList.contains(kPassNullError)) {
                  setState(() {
                    erorrList.add(kPassNullError);
                  });
                } else if (value.isNotEmpty &&
                    value.length < 8 &&
                    !erorrList.contains(kShortPassError)) {
                  setState(() {
                    erorrList.add(kShortPassError);
                  });
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: Icons.lock_outline_rounded,
              hint: 'Enter your Password',
              lable: 'Password',
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: kPrimaryColor,
                  value: checkValue,
                  onChanged: (value) {
                    setState(() {
                      checkValue = value!;
                    });
                  },
                ),
                Text(
                  'Remember me',
                  style: TextStyle(fontSize: getProportionateScreenWidth(15)),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    context.push(AppRouter.kForgetPassword);
                  },
                  child: Text(
                    'Forget password',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      color: kTextColor,
                      fontSize: getProportionateScreenWidth(15),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            FormErorr(
              erorrList: erorrList.isEmpty ? fireBaseErorrList : erorrList,
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            CustomBotton(
              text: 'Continue',
              onPressed: () async {
                if (formKey.currentState!.validate() && erorrList.isEmpty) {
                  formKey.currentState!.save();
                  BlocProvider.of<SigninCubit>(context).signInWithEmailAndPass(
                    email: emailController.text,
                    password: passController.text,
                  );
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
