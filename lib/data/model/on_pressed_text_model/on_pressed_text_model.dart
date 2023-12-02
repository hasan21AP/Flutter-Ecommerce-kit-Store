
import 'package:ecommerce_kit_store/core/constants/colors.dart';
import 'package:flutter/material.dart';

class OnPresseTextModel extends StatelessWidget {
  const OnPresseTextModel({super.key, this.text, this.onTap});

  final String? text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      onTap: onTap,
      child: Text(text!,
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
        color: AppColors.kMainColor,
        fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}