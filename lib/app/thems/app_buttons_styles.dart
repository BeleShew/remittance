import 'package:flutter/material.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';

class AppButtonStyles {

  static final defaultStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppColors.primary),
    foregroundColor: WidgetStateProperty.all(AppColors.white),
    padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: MySize.size20??0, vertical: MySize.size10??0)),
    minimumSize: WidgetStateProperty.all(const Size(400, 40)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MySize.size30??0),
      ),
    ),
    textStyle: WidgetStateProperty.all(
       TextStyle(fontSize:MySize.size22, fontWeight: FontWeight.bold),
    ),
  );

  static final dark = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppColors.black),
    foregroundColor: WidgetStateProperty.all(AppColors.white),
    padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: MySize.size20??0, vertical: MySize.size10??0)),
    minimumSize: WidgetStateProperty.all(const Size(400, 40)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MySize.size30??0),
      ),
    ),
    textStyle: WidgetStateProperty.all(
      TextStyle(fontSize: MySize.size22, fontWeight: FontWeight.bold),
    ),
  );

  static final darkBorderButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(const Color(0xFF1C1C1C)),
    foregroundColor: WidgetStateProperty.all(AppColors.white),
    padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: MySize.size20??0, vertical: MySize.size10??0)),
    minimumSize: WidgetStateProperty.all(const Size(400, 50)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MySize.size4??0),
        side:const BorderSide(width: 1, color: AppColors.darkGrey)
      ),
    ),
    textStyle: WidgetStateProperty.all(
      TextStyle(fontSize: MySize.size18, fontWeight: FontWeight.w500),
    ),
  );

  static final darkRoundedBorderButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(const Color(0xFF1C1C1C)),
    foregroundColor: WidgetStateProperty.all(AppColors.darkRoundedButtonColor),
    padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: MySize.size20??0, vertical: MySize.size10??0)),
    minimumSize: WidgetStateProperty.all(const Size(400, 50)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MySize.size40??0),
          side:const BorderSide(width: 1, color: AppColors.darkRoundedButtonColor)
      ),
    ),
    textStyle: WidgetStateProperty.all(
      TextStyle(fontSize: MySize.size18, fontWeight: FontWeight.w500,color: AppColors.darkRoundedButtonColor),
    ),
  );

//flat
  static final flat = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppColors.black),
    foregroundColor: WidgetStateProperty.all(AppColors.white),
    padding: WidgetStateProperty.all(
         EdgeInsets.symmetric(horizontal: MySize.size20??0, vertical: MySize.size10??0)),
    minimumSize: WidgetStateProperty.all(const Size(400, 40)),
    textStyle: WidgetStateProperty.all(
      TextStyle(fontSize: MySize.size14??0, fontWeight: FontWeight.bold),
    ),
  );

  // disable
  static final disable = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.grey),
    foregroundColor: WidgetStateProperty.all(AppColors.white),
    padding: WidgetStateProperty.all(
         EdgeInsets.symmetric(horizontal: MySize.size20??0, vertical: MySize.size10??0)),
    minimumSize: WidgetStateProperty.all(const Size(400, 40)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MySize.size30??0),
      ),
    ),
    textStyle: WidgetStateProperty.all(
      TextStyle(fontSize: MySize.size22??0, fontWeight: FontWeight.bold),
    ),
  );

  static final newButtonStyle = ButtonStyle(
    padding: WidgetStateProperty.all<EdgeInsets>(
        EdgeInsets.all(MySize.size8 ?? 0)),
    backgroundColor: WidgetStateProperty.all<Color>(
        AppColors.blue),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MySize.size10 ?? 0),
        side: const BorderSide(color: AppColors.lightestGrey),
      ),
    ),
  );
  static final newBorderButtonStyle = TextButton.styleFrom(
    foregroundColor: AppColors.blue,
    backgroundColor: Colors.transparent, // Sets the text color to blue
    side: const BorderSide(color: AppColors.blue, width: 2), // Sets the border color and width
    padding: EdgeInsets.symmetric(vertical: MySize.size8??0), // Optional: Adjust padding as needed
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(MySize.size10 ?? 0), // Adjust the radius as needed
    ),
  );
}