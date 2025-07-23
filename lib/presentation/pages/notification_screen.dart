import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remittance/app/config/extensions/them_extention.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/presentation/widgets/app_bar.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(elevation: 0,title: Text("notifications"),centerTitle: false,),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:List.generate(5, (index)=>Padding(
            padding: EdgeInsets.symmetric(horizontal: MySize.size18??0,vertical:  MySize.size5??0,),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.lightBlack,
                  borderRadius: BorderRadius.circular(MySize.size5??0)
              ),
              child: Padding(
                padding: EdgeInsets.all(MySize.size16??0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWidgetText.textWidget(
                      text: "lowBalanceAlertCheckYour",
                      themeData: context.themeData.textTheme.displaySmall!,
                      fontSize: MySize.size14,
                      // color: AppColors.darkGrey,
                      fontWeight: 400,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
