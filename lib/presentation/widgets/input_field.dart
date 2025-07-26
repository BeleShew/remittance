import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';

class InputTextFormField extends StatelessWidget {
  const InputTextFormField({super.key,this.controller,this.isBordered=false,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.isDescription = false,
    this.readOnly = false,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.color,
    this.fillColor,
    this.inputFormatters,
    this.textAlign=TextAlign.center,
    this.maxLength,
    this.validator,});

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? color;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isDescription;
  final bool isBordered;
  final bool readOnly;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return  isDescription?
    TextFormField(
      textAlign: textAlign,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      readOnly: readOnly,
      maxLength: maxLength,
      inputFormatters:inputFormatters,
      validator: validator,
      style: const TextStyle(
        decoration: TextDecoration.none,
        decorationThickness: 0,
      ),
      decoration:InputDecoration(
        // hintText: "Business Description",
        hintText: hintText,
        suffixIcon:suffixIcon,
        prefixIcon: prefixIcon,
        labelText:labelText ,
        hintStyle: TextWidgetText.textWidgetStyle(
            themeData: themeData.textTheme.headlineMedium!,
            fontWeight: 400,
            fontSize:MySize.size12,
            color:AppColors.textColor
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide.none,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide.none,
        ),// No border
        contentPadding: EdgeInsets.symmetric(
            vertical:MySize.size14??0,
            horizontal: MySize.size14??0),
        filled: true, // If you want a background color
        // fillColor:fillColor?? const Color(0xffF1F1F1),
      ),
      minLines: 3,
      maxLines: null, // Set maxLines to null to allow multiple lines
    ):
    isBordered?
    TextFormField(
      textAlign: textAlign,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLength: maxLength,
      readOnly: readOnly,
      validator: validator,
      style: const TextStyle(
        decoration: TextDecoration.none,
        decorationThickness: 0,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon:suffixIcon ,
        prefixIcon: prefixIcon,
        // hintStyle: TextWidgetText.textWidgetStyle(
        //     themeData: themeData.textTheme.headlineMedium!,
        //     fontWeight: 400,
        //     fontSize:MySize.size12,
        //     // color:color??AppColors.textColor
        // ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(MySize.size5??0)),
        //   borderSide: const BorderSide(width: 1, color: AppColors.darkGrey),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(MySize.size5??0)),
        //   borderSide: const BorderSide(width: 1, color: AppColors.darkGrey),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(MySize.size5??0)),
        //   borderSide: const BorderSide(width: 1, color:AppColors.darkGrey),
        // ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(MySize.size5??0)),
        //   borderSide: const BorderSide(width: 1, color: AppColors.darkGrey),
        // ),// No border
        // contentPadding: EdgeInsets.symmetric(
        //     vertical:MySize.size14??0,
        //     horizontal: MySize.size14??0),
        // filled: true, // If you want a background color
        // fillColor:fillColor?? const Color(0xFF1C1C1C),
        fillColor:fillColor,
      ),
    ):
    TextFormField(
      textAlign: textAlign,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      onSaved: onSaved,
      readOnly: readOnly,
      maxLength: maxLength,
      validator: validator,
      style: const TextStyle(
        decoration: TextDecoration.none,
        decorationThickness: 0,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon:suffixIcon ,
        prefixIcon: prefixIcon,
        hintStyle: TextWidgetText.textWidgetStyle(
            themeData: themeData.textTheme.headlineMedium!,
            fontWeight: 400,
            fontSize:MySize.size12,
            color:color??AppColors.textColor
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide.none,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide.none,
        ),// No border
        contentPadding: EdgeInsets.symmetric(
            vertical:MySize.size14??0,
            horizontal: MySize.size14??0),
        filled: true, // If you want a background color
        // fillColor:fillColor?? const Color(0xffF1F1F1),
      ),
    );
  }
}
