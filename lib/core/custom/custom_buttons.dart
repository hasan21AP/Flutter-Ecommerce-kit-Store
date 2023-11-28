
import 'package:ecommerce_kit_store/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'custom_space.dart';


class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({super.key, this.text, this.onTap, this.color});

  final String? text;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 60,
                  width: SizeConfig.screenWidth! * 0.8,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                            text!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFFFFF9FF),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              height: 0.06,
                            ),
                          ),
                        ),
                      )
                  );
                }
              }


class CustomElevetedButton extends StatelessWidget {
  const CustomElevetedButton({super.key, this.text, 
  this.onPressed, this.mainColor, 
  this.secondColor, this.relativisticWidth, 
  this.relativisticHeight, this.circleRadius, 
  this.textStyle});

  final String? text;
  final VoidCallback? onPressed;
  final Color? mainColor;
  final Color? secondColor;
  final double? relativisticWidth;
  final double? relativisticHeight;
  final double? circleRadius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    foregroundColor: secondColor,
                    minimumSize: Size(SizeConfig.screenWidth! * relativisticWidth!, SizeConfig.screenHeight! * relativisticHeight!),
                    enableFeedback: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(circleRadius!),
                    ),
                    textStyle: textStyle
                  ), 
                  child: Text(text!),
                  );
  }
}              


class CustomSignInButton extends StatelessWidget {
  const CustomSignInButton({super.key, this.text, 
  this.onPressed, this.mainColor, 
  this.secondColor, this.iconData, 
  this.iconColor, this.iconSize, 
  this.horizontalPadding, this.relativisticWidth, 
  this.relativisticHeight, this.circleRadius, 
  this.textStyle, this.borderWidth, 
  this.borderColor, this.elevation});
  
  final String? text;
  final VoidCallback? onPressed;
  final IconData? iconData;
  final Color? mainColor;
  final Color? secondColor;
  final Color? iconColor;
  final double? iconSize;
  final double? horizontalPadding;
  final double? relativisticWidth;
  final double? relativisticHeight;
  final double? circleRadius;
  final TextStyle? textStyle;
  final double? borderWidth;
  final Color? borderColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            foregroundColor: secondColor,
            elevation: elevation,
            minimumSize: Size(
              SizeConfig.screenWidth! * relativisticWidth!, 
              SizeConfig.screenHeight! * relativisticHeight!),
            enableFeedback: false,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: borderWidth!,
                color: borderColor!,
              ),
              borderRadius: BorderRadius.circular(circleRadius!),
            ),
            textStyle: textStyle,
      ),
      child: SizedBox(
        width: SizeConfig.screenWidth! * 0.84,
        height: SizeConfig.screenHeight! * 0.07,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Icon(
                  iconData,
                  color: iconColor,
                  size: iconSize,
                  ),
                const HorizanintalSpace(value: 2),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding!),
                  child: Text(
                    text!,
                    ),
                ),
          ]
          ,),
      )
      );
  }
}


