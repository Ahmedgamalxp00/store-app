import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/utils/size_config.dart';

class FormErorr extends StatelessWidget {
  const FormErorr({super.key, required this.erorrList});
  final List erorrList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        erorrList.length,
        (index) => erorrText(erorrList[index]),
      ),
    );
  }

  Row erorrText(String text) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          height: getProportionateScreenHeight(14),
          width: getProportionateScreenWidth(14),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(text),
      ],
    );
  }
}
