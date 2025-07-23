import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remittance/app/config/extensions/them_extention.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/app/utils/helper_methods.dart';
import 'package:remittance/presentation/widgets/nav_bar_app_bar.dart';
import 'package:remittance/presentation/widgets/service_widget.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';
import 'package:remittance/presentation/widgets/visibility_toggle.dart';

@RoutePage()
class LandingScreen extends StatefulWidget {
  const LandingScreen({
    super.key,
  });
  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool showBalance=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MySize.size22??0),
            child: _getGreetingWidget(),
          ),
           SizedBox(height: MySize.size12,),
          _balanceWidget(),
          SizedBox(
            height: MySize.size30,
          ),
          const ServiceWidget()
        ],
      ),
    );
  }

  Widget _balanceWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MySize.size10 ?? 0, horizontal: MySize.size22 ?? 0),
      child: Container(
        decoration: BoxDecoration(
          // gradient: _containerGradient(),
          borderRadius: BorderRadius.all(Radius.circular(MySize.size10 ?? 0)),
          image: const DecorationImage(
            image: AssetImage('assets/images/balance_card.png'), // Replace with your image path
            fit: BoxFit.cover,
            scale: 0.6
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: MySize.size20 ?? 0, horizontal: MySize.size20 ?? 0),
          child:
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidgetText.textWidget(
                  text: "Financial Overview",
                  themeData: context.themeData.textTheme.displaySmall!,
                  fontSize: MySize.size16,
                  fontWeight: 600,
                  textAlign: TextAlign.start,
                  color: AppColors.black,
              ),
              SizedBox(
                height: MySize.size10,
              ),
              TextWidgetText.textWidget(
                  text: "Balance" ,
                  themeData: context.themeData.textTheme.displaySmall!,
                  fontSize: MySize.size14,
                  fontWeight: 400,
                  textAlign: TextAlign.start,
                  color: AppColors.black,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:showBalance? CrossAxisAlignment.center:CrossAxisAlignment.start,
                children: [
                  TextWidgetText.textWidget(
                      text: showBalance ? "10,000 ${"USD"}" :"******" ,
                      themeData: context.themeData.textTheme.displaySmall!,
                      fontSize: MySize.size24,
                      fontWeight: 400,
                      textAlign: TextAlign.start,
                      color: AppColors.black,
                  ),
                  SizedBox(width: MySize.size10,),
                  VisibilityToggle(
                    onToggle: (){
                      setState(() {
                        showBalance=!showBalance;
                      });
                    },
                    isVisible: !showBalance,
                    iconColor: AppColors.black,
                  ),
                ],
              ),
              TextWidgetText.textWidget(
                text: "Jul 25,2025 2:43:44 PM" ,
                themeData: context.themeData.textTheme.displaySmall!,
                fontSize: MySize.size12,
                fontWeight: 400,
                textAlign: TextAlign.start,
                color: AppColors.black,
              ),
              SizedBox(
                height: MySize.size10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getGreetingWidget() {
    return NavAppBarTitle(
      title: "Selam Belachew",
      titleColor: AppColors.white,
      subTitleColor: AppColors.white,
      subTitle: getGreeting(),
      iconPath: Icons.notifications,
    );
  }
}
