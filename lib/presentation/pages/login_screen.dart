import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/app/config/extensions/them_extention.dart';
import 'package:remittance/app/config/route/routes.gr.dart';
import 'package:remittance/app/thems/app_buttons_styles.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/app/utils/auth.dart';
import 'package:remittance/app/utils/enums.dart';
import 'package:remittance/app/utils/helper_methods.dart';
import 'package:remittance/presentation/riverpod/user/authState.dart';
import 'package:remittance/presentation/riverpod/user/userRepository.dart';
import 'package:remittance/presentation/widgets/app_bar.dart';
import 'package:remittance/presentation/widgets/input_field.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';
import 'package:remittance/presentation/widgets/visibility_toggle.dart';

@RoutePage()
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final __emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = true;

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      _emailController.text="bele@gmail.com";
      _passwordController.text = "Abcd@1234";
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
                      text: "Password",
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
      key: __emailFormKey,
      child: InputTextFormField(
        controller: _emailController,
        isBordered: true,
        readOnly: false,
        textAlign: TextAlign.start,
        validator: (values) {
          if (values == null || values.isEmpty) {
            return 'Email Is Required';
          } else if (!isEmail(values)) {
            return "Enter valid email address";
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        onChanged: (values) {
          _validateFormKey(__emailFormKey);
        },
        hintText: "Email",
      ),
    );
  }

  Widget _pINWidget() {
    return Form(
      key: _passwordFormKey,
      child: InputTextFormField(
        controller: _passwordController,
        readOnly: false,
        isBordered: true,
        obscureText: _showPassword,
        textAlign: TextAlign.start,
        validator: (values) {
          if (values == null || values.isEmpty) {
            return 'Password is required';
          }
          return validatePassword(values);
        },
        onChanged: (values) {
          _validateFormKey(_passwordFormKey);
        },
        hintText: "Password",
        suffixIcon: VisibilityToggle(
          onToggle: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
          isVisible: _showPassword,
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
    final isLoading = ref.watch(authNotifierProvider).status == AuthStatus.loading;
    return TextButton(
        style: AppButtonStyles.darkRoundedBorderButton,
      onPressed: isLoading
          ? null
          : () async {
        if (_validateFormKey(__emailFormKey) && _validateFormKey(_passwordFormKey)) {
          final email = _emailController.text;
          await ref.read(authNotifierProvider.notifier).login(email,_passwordController.text);
          final authState = ref.read(authNotifierProvider);
          if (authState.status == AuthStatus.authenticated) {
            context.router.replace(HomeRoute());
          } else if (authState.status == AuthStatus.error) {
            if (mounted) {
              showAnimatedSnackBar(
                message:authState.errorMessage ?? 'Login failed',
                context: context,
                showCloseIcon: true,
              );
            }
          }
        }
      },
        child:isLoading
            ? const CircularProgressIndicator(): Text(
          "Login",
          style: TextWidgetText.textWidgetStyle(
            themeData: context.themeData.textTheme.headlineSmall!,
            fontWeight: 700,
            fontSize: MySize.size18,
            color: AppColors.darkRoundedButtonColor,
          ),
        ),
    );
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
