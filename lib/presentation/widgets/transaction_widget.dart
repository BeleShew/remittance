import 'package:flutter/material.dart';
import 'package:remittance/app/config/extensions/them_extention.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';


class TransactionWidget extends StatelessWidget {
  const TransactionWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MySize.size14 ?? 0, vertical: MySize.size5 ?? 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextWidgetText.textWidget(
                  text: "Transaction",
                  themeData: context.themeData.textTheme.displaySmall!,
                  fontSize: MySize.size14,
                  fontWeight: 400,
                  textAlign: TextAlign.start,
                ),
              ),
              Flexible(
                child: TextWidgetText.textWidget(
                  text: "View All",
                  themeData: context.themeData.textTheme.displaySmall!,
                  fontSize: MySize.size14,
                  fontWeight: 400,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),

          SizedBox(height: MySize.size5,),
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightBlack,
              borderRadius: BorderRadius.all(Radius.circular(MySize.size14 ?? 0)),
            ),
            padding: EdgeInsets.symmetric(vertical: MySize.size8??0,horizontal: MySize.size10??0),
            child:Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.all(Radius.circular(MySize.size30 ?? 0),
                        ),
                      ),
                      padding: EdgeInsets.all( MySize.size8??0),
                      child: Image.asset(
                        "assets/images/convert.png",
                        width: MySize.size20,
                        height: MySize.size20,
                      ),
                    ),
                    SizedBox(width: MySize.size10,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidgetText.textWidget(
                          text: "Deposited From TeleBirr",
                          themeData: context.themeData.textTheme.displaySmall!,
                          fontSize: MySize.size14,
                          fontWeight: 400,
                          textAlign: TextAlign.start,
                        ),
                        TextWidgetText.textWidget(
                          text: "15 : 12 pm",
                          themeData: context.themeData.textTheme.displaySmall!,
                          fontSize: MySize.size8,
                          fontWeight: 400,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWidgetText.textWidget(
                      text: "+ \$ 4.49",
                      themeData: context.themeData.textTheme.displaySmall!,
                      fontSize: MySize.size10,
                      fontWeight: 500,
                      color: AppColors.greenColor,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: MySize.size5,),
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightBlack,
              borderRadius: BorderRadius.all(Radius.circular(MySize.size14 ?? 0)),
            ),
            padding: EdgeInsets.symmetric(vertical: MySize.size8??0,horizontal: MySize.size10??0),
            child:Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.all(Radius.circular(MySize.size30 ?? 0),
                        ),
                      ),
                      padding: EdgeInsets.all( MySize.size8??0),
                      child: Image.asset(
                        "assets/images/send_money.png",
                        width: MySize.size20,
                        height: MySize.size20,
                      ),
                    ),
                    SizedBox(width: MySize.size10,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidgetText.textWidget(
                          text: "Transfer of funds",
                          themeData: context.themeData.textTheme.displaySmall!,
                          fontSize: MySize.size14,
                          fontWeight: 400,
                          textAlign: TextAlign.start,
                        ),
                        TextWidgetText.textWidget(
                          text: "15 : 30 pm",
                          themeData: context.themeData.textTheme.displaySmall!,
                          fontSize: MySize.size8,
                          fontWeight: 400,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidgetText.textWidget(
                      text: "-\$ 4.49",
                      themeData: context.themeData.textTheme.displaySmall!,
                      fontSize: MySize.size10,
                      fontWeight: 500,
                      color: AppColors.lightPink,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
