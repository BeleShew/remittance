import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remittance/app/config/extensions/them_extention.dart';
import 'package:remittance/app/config/route/routes.gr.dart';
import 'package:remittance/app/thems/app_buttons_styles.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/app/utils/auth.dart';
import 'package:remittance/app/utils/helper_methods.dart';
import 'package:remittance/presentation/widgets/app_bar.dart';
import 'package:remittance/presentation/widgets/input_field.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';
import 'package:remittance/presentation/widgets/visibility_toggle.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneNumberFormKey = GlobalKey<FormState>();
  final __pINFormKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _pINController = TextEditingController();
  bool showPIN = true;

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      _phoneNumberController.text="0946555036";
      _pINController.text = "123456";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showLeadingWidget: false,
        actions: [
          Padding(
          padding: EdgeInsets.symmetric(horizontal:MySize.size8??0,vertical: MySize.size10??0),
          child: Container(),
        )],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50,),
              _buildLogo(),
              const SizedBox(height: 50,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.size22??0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextWidgetText.textWidget(
                      text: "Start Managing Your Finances Securely",
                      themeData: context.themeData.textTheme.displaySmall!,
                      fontSize: MySize.size16,
                      fontWeight: 400,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: MySize.size16,),
                    TextWidgetText.textWidget(
                      text: "Phone Number",
                      themeData: context.themeData.textTheme.displaySmall!,
                      fontSize: MySize.size18,
                      fontWeight: 400,
                      textAlign: TextAlign.start,
                      // color: AppColors.black,
                    ),
                    SizedBox(height: MySize.size5,),
                    _phoneNumberWidget(),
                    SizedBox(height: MySize.size10,),
                    TextWidgetText.textWidget(
                      text: "PIN",
                      themeData: context.themeData.textTheme.displaySmall!,
                      fontSize: MySize.size18,
                      fontWeight: 400,
                      textAlign: TextAlign.start,
                      // color: AppColors.black,
                    ),
                    SizedBox(height: MySize.size5,),
                    _pINWidget(),

                    SizedBox(height: MySize.size36,),
                    _joinNowButton(),
                    SizedBox(height: MySize.size14,),
                    _forgotYourPIN(),

                    SizedBox(height: MySize.size14,),
                    _registerButton()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Image _buildLogo() => Image.asset("assets/images/remittance.png",fit: BoxFit.contain,width: 100,height: 200,);
  
  bool _validateFormKey(GlobalKey<FormState> formKey) {
    return formKey.currentState!.validate();
  }

  Widget _phoneNumberWidget() {
    return Form(
      key: _phoneNumberFormKey,
      child: InputTextFormField(
        controller: _phoneNumberController,
        isBordered: true,
        readOnly: false,
        textAlign: TextAlign.start,
        validator: (values) {
          if (values == null || values.isEmpty) {
            return 'Phone Number Is Required';
          } else if (!isPhoneNumber(values)) {
            return "Enter Valid Phone Number";
          }
          return null;
        },
        keyboardType: TextInputType.number,
        onChanged: (values) {
          _validateFormKey(_phoneNumberFormKey);
        },
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'\d')),
        ],
        hintText: "Phone Number",
      ),
    );
  }

  Widget _pINWidget() {
    return Form(
      key: __pINFormKey,
      child: InputTextFormField(
        controller: _pINController,
        readOnly: false,
        isBordered: true,
        obscureText: showPIN,
        textAlign: TextAlign.start,
        maxLength: 6,
        validator: (values) {
          if (values == null || values.isEmpty) return 'PIN Required';
          if(values.length<6) return "PIN Is To Short";
          // return validatePassword(values);
          return null;
        },
        onChanged: (values) {
          _validateFormKey(__pINFormKey);
        },
        hintText: "PIN",
        suffixIcon: VisibilityToggle(
          onToggle: () {
            setState(() {
              showPIN = !showPIN;
            });
          },
          isVisible: showPIN,
        ),
      ),
    );
  }

  Widget _forgotYourPIN() {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWidgetText.textWidget(
            text: "Forgot Your PIN",
            themeData: context.themeData.textTheme.displaySmall!,
            fontSize: MySize.size16,
            fontWeight: 400,
            textAlign: TextAlign.start,
            // color: AppColors.darkGrey,
          ),
          SizedBox(width: MySize.size5,),
          TextWidgetText.textWidget(
            text: "Face",
            themeData: context.themeData.textTheme.displaySmall!,
            fontSize: MySize.size16,
            fontWeight: 400,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Widget _joinNowButton() {
    return TextButton(
        style: AppButtonStyles.darkRoundedBorderButton,
        child: Text(
          "Login",
          style: TextWidgetText.textWidgetStyle(
            themeData: context.themeData.textTheme.headlineSmall!,
            fontWeight: 700,
            fontSize: MySize.size18,
            color: AppColors.darkRoundedButtonColor,
          ),
        ),
        onPressed: () async {
          if (_validateFormKey(_phoneNumberFormKey) && _validateFormKey(__pINFormKey)) {
            context.router.replace(HomeRoute());
          }
        });
  }

  Widget _registerButton() {
    return TextButton(
        style: AppButtonStyles.darkBorderButton,
        child: Text(
          "Sign up",
          style: TextWidgetText.textWidgetStyle(
            themeData: context.themeData.textTheme.headlineSmall!,
            fontWeight: 500,
            fontSize: MySize.size18,
            color: AppColors.white,
          ),
        ),
        onPressed: () async {
          context.router.push(CreateAccountRoute());
        });
  }
}
