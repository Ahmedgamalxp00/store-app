import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/constants.dart';
import 'package:store_app/core/utils/size_config.dart';
import 'package:store_app/core/widgets/custom_botton.dart';
import 'package:store_app/features/authentication/presentation/controllers/signup_cubit/signup_cubit.dart';
import 'package:store_app/features/authentication/presentation/views/widgets/custom_formfield.dart';
import 'package:store_app/features/authentication/presentation/views/widgets/form_erorr.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });
  @override
  State<SignUpForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  String? email, password;
  bool checkBoxValue = false;
  String? confirmPass;
  bool obscureText = true;
  final List<String> erorrList = [];
  @override
  Widget build(BuildContext context) {
    final List<String> fireBaseErorrList =
        BlocProvider.of<SignupCubit>(context).erorrList;
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomFormField(
              controller: nameController,
              onsave: (value) {},
              onChanged: (value) {
                if (value == null ||
                    value.isNotEmpty && erorrList.contains(kNamelNullError)) {
                  setState(() {
                    erorrList.remove(kNamelNullError);
                  });
                }
                return null;
              },
              validator: (value) {
                if (value == null ||
                    value.isEmpty && !erorrList.contains(kNamelNullError)) {
                  setState(() {
                    erorrList.add(kNamelNullError);
                  });
                }
                return null;
              },
              keyboardType: TextInputType.name,
              suffixIcon: Icons.person_2_outlined,
              hint: 'Enter your Name',
              lable: 'Name',
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            CustomFormField(
              controller: emailController,
              onsave: (value) {
                email = value;
              },
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
                } else if (fireBaseErorrList.contains(kEmailAlreadyInUse)) {
                  setState(() {
                    fireBaseErorrList.remove(kEmailAlreadyInUse);
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
              onSuffixTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              onsave: (value) {
                password = value;
              },
              obscureText: obscureText,
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
                } else if (value == confirmPass &&
                    erorrList.contains(kMatchPassError)) {
                  setState(() {
                    erorrList.remove(kMatchPassError);
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
                } else if (value.isNotEmpty &&
                    value != confirmPass &&
                    !erorrList.contains(kMatchPassError)) {
                  setState(() {
                    erorrList.add(kMatchPassError);
                  });
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: obscureText
                  ? Icons.lock_outline_rounded
                  : Icons.lock_open_outlined,
              hint: 'Enter your Password',
              lable: 'Password',
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            CustomFormField(
              onSuffixTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              obscureText: obscureText,
              onChanged: (value) {
                setState(() {
                  confirmPass = value;
                });
                if (value == confirmPass &&
                    erorrList.contains(kMatchPassError)) {
                  setState(() {
                    erorrList.remove(kMatchPassError);
                  });
                }
                return null;
              },
              validator: (value) {
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: obscureText
                  ? Icons.lock_outline_rounded
                  : Icons.lock_open_outlined,
              hint: 'Enter your Password again',
              lable: 'Confirm Password',
            ),
            SizedBox(
              height: getProportionateScreenHeight(14),
            ),
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
                  BlocProvider.of<SignupCubit>(context).signUpWithEmailAndPass(
                    email: emailController.text,
                    password: passController.text,
                    name: nameController.text,
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
