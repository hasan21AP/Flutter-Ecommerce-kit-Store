
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:ecommerce_kit_store/core/custom/custom_forms.dart';
import 'package:flutter/material.dart';

class LineSeparetionContainer extends StatelessWidget {
  const LineSeparetionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(right: 18),
            child: CustomLineContainer(
              color: AppColors.kLightColor,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Text('OR',
          style: Theme.of(context).textTheme.displayMedium
          ),
        ),
        const Flexible(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(left: 18),
            child: CustomLineContainer(
              color: AppColors.kLightColor,
            ),
          ),
        )
      ],
    );
  }
}