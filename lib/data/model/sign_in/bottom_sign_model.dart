
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BottomSignModel extends StatelessWidget {
  const BottomSignModel({super.key, this.text, this.onTapText, this.onTap});

  final String? text;
  final String? onTapText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text( text!,
      style: Theme.of(context).textTheme.displaySmall,
      ),
      InkWell(
        enableFeedback: false,
        onTap: onTap,
        child: Text(onTapText!,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
          color: AppColors.kMainColor,
          fontWeight: FontWeight.w700,
          )
        )
      )
    ]
  );
  }
}