import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remittance/app/config/extensions/them_extention.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/app/utils/animated_snack_bar.dart';
import 'package:remittance/app/utils/enums.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';


final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
OverlayEntry? _overlayEntry;

String enumToString<T extends Enum>(T value) => value.toString().split('.').last;


bool isPhoneNumber(String s) {
  if (s.length > 16 || s.length < 5) return false;
  return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
}

String? validatePassword(String value) {
  const String passwordPattern = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(passwordPattern);
  if (!regex.hasMatch(value)) {
    return "Password too weak. Add uppercase, number & symbol.";
  }
  return null;
}

bool validateConfirmPassword(String password,String value) {
  if (value !=password) {
    return false;
  }
  return true;
}

bool isEmail(String input) {
  final emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.[a-zA-Z]{2,}$');
  return emailRegex.hasMatch(input);
}

bool hasMatch(String? value, String pattern) {
  return (value == null) ? false : RegExp(pattern).hasMatch(value);
}

bool validateCurrentFormKey(GlobalKey<FormState> formKey) {
  return formKey.currentState!.validate();
}

String getGreeting() {
  final now = DateTime.now();
  final hour = now.hour;
  if (hour >= 5 && hour < 12) {
    return 'Good Morning';
  } else if (hour >= 12 && hour < 17) {
    return 'Good Afternoon';
  } else if (hour >= 17 && hour < 21) {
    return 'Good Evening';
  } else {
    return 'Good Night';
  }
}



void showCustomSnackBar({required String message,Color? backgroundColor,Color? textColor,required BuildContext context}) {
  final snackBar = SnackBar(
    content: Padding(
      padding: EdgeInsets.symmetric(horizontal:MySize.size5??0,vertical: MySize.size3??0),
      child: TextWidgetText.textWidget(
          text: message,
          themeData: context.themeData.textTheme.displaySmall!,
          fontSize: MySize.size16,
          fontWeight: 500,
          textAlign: TextAlign.start,
          color: AppColors.primary)
    ),
    backgroundColor: backgroundColor??AppColors.white,
    elevation: 2,
    dismissDirection: DismissDirection.horizontal,
    showCloseIcon: true,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
  );
  scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}

String generateAccountNumber() {
  final random = Random();
  String accountNumber = '';
  accountNumber += (random.nextInt(9) + 1).toString(); // 1–9
  for (int i = 1; i < 13; i++) {
    accountNumber += random.nextInt(10).toString(); // 0–9
  }
  return accountNumber;
}

   void showAnimatedSnackBar({
    required String message,
    bool? showCloseIcon,
    Color? backgroundColor,
    Color? textColor,
    required BuildContext context,
     PageTransitionType transitionType=PageTransitionType.circular,
    Duration duration = const Duration(seconds: 3),}) {
    if (_overlayEntry != null) {
      return;
    }
    final overlayState = Overlay.of(context);
    late OverlayEntry overlayEntry;
    bool removed = false;
    void removeOverlay() {
      if (!removed) {
        overlayEntry.remove();
        removed = true;
        _overlayEntry = null; // Reset the tracker once removed
      }
    }
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          bottom: 52,
          left: 10,
          right: 10,
          child: AnimatedSnackBar(
            message: message,
            transitionType: transitionType,
            showCloseIcon: showCloseIcon,
            backgroundColor: backgroundColor ?? Colors.black,
            textColor: textColor ?? Colors.white,
            onDismiss: removeOverlay,
          ),
        );
      },
    );
    overlayState.insert(overlayEntry);
    _overlayEntry = overlayEntry;
    Future.delayed(duration, removeOverlay);
  }






