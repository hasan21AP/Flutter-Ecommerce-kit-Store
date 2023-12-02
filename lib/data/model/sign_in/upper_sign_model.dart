
import 'package:ecommerce_kit_store/core/constants/images_assets.dart';
import 'package:ecommerce_kit_store/core/custom/custom_space.dart';
import 'package:flutter/material.dart';

class UpperSignModel extends StatelessWidget {
  const UpperSignModel({super.key, this.title, this.supTitle});

  final String? title;
  final String? supTitle;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const VerticalSpace(value: 5),
      Image.asset(ImagesAssets.iconImage),
      const VerticalSpace(value: 2),
      Text(title! ,
      style: Theme.of(context).textTheme.displayLarge,),
      const VerticalSpace(value: 1),
      Text(supTitle! ,
      style: Theme.of(context).textTheme.displaySmall,),
      const VerticalSpace(value: 3),
    ]);
  }
}

