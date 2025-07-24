import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/app/config/extensions/them_extention.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/app/utils/helper_methods.dart';
import 'package:remittance/domain/dto/user/login_response.dart';
import 'package:remittance/presentation/riverpod/user/userProvider.dart';
import 'package:remittance/presentation/widgets/nav_bar_app_bar.dart';
import 'package:remittance/presentation/widgets/service_widget.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';
import 'package:remittance/presentation/widgets/visibility_toggle.dart';
import 'package:intl/intl.dart';
@RoutePage()
class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  bool showBalance = false;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final user = authState.user;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MySize.size22 ?? 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getGreetingWidget(user),
            SizedBox(height: MySize.size12),
            _balanceWidget(user),
            SizedBox(height: MySize.size30),
            const ServiceWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getGreetingWidget(LoginResponse? user) {
    return NavAppBarTitle(
      title: "Selam ${user?.name ?? "BelachewSh"}",
      titleColor: AppColors.white,
      subTitleColor: AppColors.white,
      subTitle: getGreeting(),
      iconPath: Icons.notifications,
    );
  }

  Widget _balanceWidget(LoginResponse? user) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MySize.size10 ?? 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MySize.size10 ?? 0),
          image: const DecorationImage(
            image: AssetImage('assets/images/balance_card.png'),
            fit: BoxFit.cover,
            scale: 0.6,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(MySize.size20 ?? 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _text("Financial Overview", MySize.size16, FontWeight.w600),
              SizedBox(height: MySize.size10),
              _text("Balance", MySize.size14, FontWeight.w400),
              SizedBox(height: MySize.size8),
              Row(
                crossAxisAlignment: showBalance
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  _text(
                    showBalance
                        ? "${user?.balance ?? 0} ${user?.currency ?? ''}"
                        : "******",
                    MySize.size24,
                    FontWeight.w400,
                  ),
                  SizedBox(width: MySize.size10),
                  VisibilityToggle(
                    onToggle: () => setState(() => showBalance = !showBalance),
                    isVisible: !showBalance,
                    iconColor: AppColors.black,
                  ),
                ],
              ),
              SizedBox(height: MySize.size10),
              _text(DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()), MySize.size12, FontWeight.w400),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(String text, double? size, FontWeight weight) {
    return TextWidgetText.textWidget(
      text: text,
      themeData: context.themeData.textTheme.displaySmall!,
      fontSize: size,
      fontWeight: weight.index,
      textAlign: TextAlign.start,
      color: AppColors.black,
    );
  }
}
