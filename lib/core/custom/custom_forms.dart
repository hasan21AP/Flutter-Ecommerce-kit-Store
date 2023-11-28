
import 'package:flutter/material.dart';


class CustomTextFieldFormForUserName extends StatelessWidget {
    const CustomTextFieldFormForUserName(
    {super.key, this.text, required this.focusBorderColor, 
    this.icon, this.onPressed, 
    this.validator, this.formKey, 
    this.myController, this.hintText, 
    this.textColor, this.iconColor, 
    this.borderColor, this.iconFocusColor}
    );

  final String? text;
  final Color? focusBorderColor;
  final Widget? icon;
  final VoidCallback? onPressed;
  final String? Function(String?)? validator;
  final Key? formKey;
  final TextEditingController? myController;
  final String? hintText;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color? iconFocusColor;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: myController,
          keyboardType: TextInputType.name,
          autocorrect: true,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: icon,
            prefixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? iconFocusColor!
                : iconColor!),
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
            labelText: text,
            hintText: hintText,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor!,
                width: 2
              ), 
              ),
            focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: focusBorderColor!,
                          width: 2,
                   )
              ),
           ),
          style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
        ),
      ),
    );
  }
}

class CustomTextFieldFormForEmail extends StatelessWidget {
    const CustomTextFieldFormForEmail(
    {super.key, this.text, required this.focusBorderColor, 
    this.icon, this.onPressed, 
    this.validator, this.formKey, 
    this.myController, this.hintText, 
    this.textColor, this.iconColor, 
    this.borderColor, this.iconFocusColor}
    );

  final String? text;
  final Color? focusBorderColor;
  final Widget? icon;
  final VoidCallback? onPressed;
  final String? Function(String?)? validator;
  final Key? formKey;
  final TextEditingController? myController;
  final String? hintText;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color? iconFocusColor;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: myController,
          keyboardType: TextInputType.emailAddress,
          autocorrect: true,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: icon,
            prefixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? iconFocusColor!
                : iconColor!),
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
            labelText: text,
            hintText: hintText,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor!,
                width: 2
              ), 
              ),
            focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: focusBorderColor!,
                          width: 2,
                   )
              ),
           ),
          style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
        ),
      ),
    );
  }
}

class CustomTextFieldFormForPassword extends StatelessWidget {
  const CustomTextFieldFormForPassword(
    {super.key, this.text, required this.focusBorderColor, this.focusColor, 
    this.prefixIcon, this.obscureText, 
    this.onPressed, this.validator, 
    this.formKey, this.myController, 
    this.hintText, this.textColor, 
    this.iconColor, this.borderColor, 
    this.iconFocusColor, this.sefixIcon}
    );

  final String? text;
  final Color? focusBorderColor;
  final Color? focusColor;
  final Widget? prefixIcon;
  final Widget? sefixIcon;
  final bool? obscureText;
  final VoidCallback? onPressed;
  final String? Function(String?)? validator;
  final Key? formKey;
  final TextEditingController? myController;
  final String? hintText;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color? iconFocusColor;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: myController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: obscureText!,
          autocorrect: false,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
            labelText: text,
            hintText: hintText,
            prefixIcon: prefixIcon,
            prefixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? iconFocusColor!
                : iconColor!),
            floatingLabelAlignment: FloatingLabelAlignment.start,
             border: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor!,
                width: 2
              )),
            floatingLabelStyle: TextStyle(
              color: focusColor,
            ),
            suffixIcon: IconButton(
              color: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? iconFocusColor!
                : iconColor!),
              icon: sefixIcon!, 
              onPressed: onPressed
              ),
            focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: focusBorderColor!,
                          width: 2
                   )
              ),
           ),
          style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
        ),
      ),
    );
  }
}


class CustomLineContainer extends StatelessWidget {
  const CustomLineContainer({super.key, this.color});
  
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: color,
        shape: const UnderlineInputBorder( 
        borderSide: BorderSide(width: .3,
        strokeAlign: BorderSide.strokeAlignCenter
        ),
      )),
    );
  }
}



