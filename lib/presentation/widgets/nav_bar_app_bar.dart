import 'package:flutter/material.dart';
import 'package:remittance/app/config/extensions/them_extention.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';

class NavAppBarTitle extends StatelessWidget {
  const NavAppBarTitle({super.key,required this.title,required this.subTitle,this.iconPath,this.subTitleColor,this.titleColor});
  final String title;
  final String subTitle;
  final IconData? iconPath;
  final Color? titleColor;
  final Color? subTitleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 0,top: MySize.size42??0,right:MySize.size0??0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidgetText.textWidget(
                  text:title,
                  themeData: context.themeData.textTheme.displaySmall!,
                  fontSize: MySize.size16,
                  fontWeight: 700,
                  textAlign: TextAlign.start,
                  color:titleColor ?? AppColors.black,
              ),
              SizedBox(height: MySize.size5,),
              TextWidgetText.textWidget(
                  text:subTitle,
                  themeData: context.themeData.textTheme.displaySmall!,
                  fontSize: MySize.size12,
                  fontWeight: 500,
                  textAlign: TextAlign.start,
                  color:subTitleColor??AppColors.black,
              ),
            ],
          ),
        ),
         Spacer(),
        iconPath!=null? Icon(iconPath!,size: MySize.size24,):Container()
      ],
    );
  }
}
