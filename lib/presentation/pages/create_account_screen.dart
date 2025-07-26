import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/app/config/extensions/them_extention.dart';
import 'package:remittance/app/config/route/routes.gr.dart';
import 'package:remittance/app/thems/app_buttons_styles.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/app/utils/enums.dart';
import 'package:remittance/app/utils/helper_methods.dart';
import 'package:remittance/domain/dto/user/register_request.dart';
import 'package:remittance/presentation/riverpod/user/userProvider.dart';
import 'package:remittance/presentation/widgets/app_bar.dart';
import 'package:remittance/presentation/widgets/input_field.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';

@RoutePage()
class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  ConsumerState<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  final _phoneNumberController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _createPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _phoneNumberFormKey = GlobalKey<FormState>();
  final _nameFormKey = GlobalKey<FormState>();
  final _emailFormKey = GlobalKey<FormState>();
  final _createPasswordFormKey = GlobalKey<FormState>();
  final _confirmPasswordFormKey = GlobalKey<FormState>();

  bool checkTermsAndConditions = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        showLeadingWidget: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MySize.size24 ?? 0, vertical: MySize.size18 ?? 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildCreateYourAccount(),
              SizedBox(
                height: MySize.size30,
              ),
              _customInputField(
                labelText: "Full NAme",
                hintText: "Full Name",
                controller: _nameController,
                formKey: _nameFormKey,
                validator: (String? values) {
                  if(values==null || values.isEmpty||values.length<3){
                    return "Enter valid full name";
                  }
                  return null;
                },
                onChanged: (String values) {
                  validateCurrentFormKey(_nameFormKey);
                },
              ),
              SizedBox(
                height: MySize.size18,
              ),
              _customInputField(
                labelText: "Phone Number",
                hintText: "Phone Number",
                controller: _phoneNumberController,
                formKey: _phoneNumberFormKey,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly,],
                validator: (String? values) {
                  return isPhoneNumber(values??"")?null:"Enter valid phone number";
                },
                onChanged: (String values) {
                  validateCurrentFormKey(_phoneNumberFormKey);
                },
              ),
              SizedBox(
                height: MySize.size18,
              ),
              _customInputField(
                labelText: "Email",
                hintText: "Email",
                controller: _emailController,
                formKey: _emailFormKey,
                keyboardType: TextInputType.emailAddress,
                validator: (String? values) {
                  return isEmail(values??"")?null:"Enter valid email address";
                },
                onChanged: (String values) {
                  validateCurrentFormKey(_emailFormKey);
                },
              ),
              SizedBox(
                height: MySize.size18,
              ),
              _customInputField(
                labelText: "Password",
                hintText: "Password",
                controller: _createPasswordController,
                formKey: _createPasswordFormKey,
                validator: (String? values) {
                  return validatePassword(values??"");
                },
                onChanged: (String values) {
                  validateCurrentFormKey(_createPasswordFormKey);
                },
              ),
              SizedBox(
                height: MySize.size18,
              ),
              _customInputField(
                labelText: "Confirm Password",
                hintText: "Confirm Password",
                controller: _confirmPasswordController,
                formKey: _confirmPasswordFormKey,
                validator: (String? values) {
                  return validateConfirmPassword(_createPasswordController.text, values??"")?null:"Match your password please";
                },
                onChanged: (String values) {
                  validateCurrentFormKey(_confirmPasswordFormKey);
                },
              ),
              SizedBox(
                height: MySize.size22,
              ),
              _buildTermsAndConditionsWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _signUpButton(),
    );
  }

  Widget _buildTermsAndConditionsWidget() {
    return Row(
      children: [
        InkWell(
            splashFactory: NoSplash.splashFactory,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              setState(() {
                checkTermsAndConditions = !checkTermsAndConditions;
              });
            },
            child: Icon(checkTermsAndConditions
                ? Icons.check_box
                : Icons.check_box_outline_blank_outlined)),
        SizedBox(
          width: MySize.size10,
        ),
        TextWidgetText.textWidget(
          text: "I Accept The Terms And Conditions",
          themeData: context.themeData.textTheme.displaySmall!,
          fontSize: MySize.size16,
          fontWeight: 400,
          textAlign: TextAlign.start,
        )
      ],
    );
  }

  Widget buildLabelWidget({required String text}) {
    return TextWidgetText.textWidget(
      text: text,
      themeData: context.themeData.textTheme.displaySmall!,
      fontSize: MySize.size18,
      fontWeight: 400,
      textAlign: TextAlign.start,
    );
  }

  Widget _buildCreateYourAccount() {
    return TextWidgetText.textWidget(
      text: "Create Your Account",
      themeData: context.themeData.textTheme.displaySmall!,
      fontSize: MySize.size24,
      fontWeight: 500,
      textAlign: TextAlign.start,
    );
  }

  Widget _customInputField({
    required String hintText,
    required String labelText,
    required TextEditingController controller,
    required String? Function(String?)? validator,
    required void Function(String) onChanged,
    bool isBordered = true,
    bool obscureText = false,
    bool readOnly = false,
    TextAlign textAlign = TextAlign.start,
    TextInputType keyboardType = TextInputType.text,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    Widget? suffixIcon,
    GlobalKey<FormState>? formKey,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildLabelWidget(text: labelText),
        SizedBox(
          height: MySize.size5,
        ),
        Form(
          key: formKey,
          child: InputTextFormField(
            controller: controller,
            isBordered: isBordered,
            obscureText: obscureText,
            readOnly: readOnly,
            textAlign: textAlign,
            maxLength: maxLength,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            hintText: hintText,
            validator: validator,
            onChanged: onChanged,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }

  Widget _signUpButton() {
    return Padding(
      padding: EdgeInsets.only(
          left: MySize.size24 ?? 0,
          right: MySize.size24 ?? 0,
          bottom: MySize.size20 ?? 0),
      child: TextButton(
          style: AppButtonStyles.darkBorderButton,
          child: Text(
            "Sign up",
            style: TextWidgetText.textWidgetStyle(
              themeData: context.themeData.textTheme.headlineSmall!,
              fontWeight: 500,
              fontSize: MySize.size18,
            ),
          ),
          onPressed: () async {
            if(validateCurrentFormKey(_nameFormKey)&&validateCurrentFormKey(_phoneNumberFormKey)&&validateCurrentFormKey(_emailFormKey)&&
                validateCurrentFormKey(_createPasswordFormKey) &&validateCurrentFormKey(_confirmPasswordFormKey)){
              if(!checkTermsAndConditions){
                showAnimatedSnackBar(message: "Please accept terms and conditions", context: context,showCloseIcon: true);
              }
              else{
                EasyLoading.show();
                await ref.read(authNotifierProvider.notifier).register(RegisterUser(name: _nameController.text,
                    email: _emailController.text,
                    password: _createPasswordController.text,
                    balance: 1000.0,
                    currency: "USD",
                    accountNumber: generateAccountNumber(),
                    confirmPassword: _confirmPasswordController.text,
                    phoneNumber: int.tryParse(_phoneNumberController.text)??0));
                final authState = ref.read(authNotifierProvider);
                if (authState.status == AuthStatus.authenticated) {
                  context.router.popForced();
                  showAnimatedSnackBar(
                    message:'Registration is success now you can login and enjoy it!',
                    context: context,
                    showCloseIcon: false,
                  );
                }
                else if (authState.status == AuthStatus.error) {
                  if (mounted) {
                    showAnimatedSnackBar(
                      message:authState.errorMessage ?? 'Registration failed',
                      context: context,
                      showCloseIcon: true,
                    );
                  }
                }
                EasyLoading.dismiss();
              }
            }
          }),
    );
  }
}
