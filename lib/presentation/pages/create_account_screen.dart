import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remittance/app/config/extensions/them_extention.dart';
import 'package:remittance/app/thems/app_buttons_styles.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/presentation/widgets/app_bar.dart';
import 'package:remittance/presentation/widgets/input_field.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';

@RoutePage()
class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _phoneNumberController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _createPINController = TextEditingController();
  final _confirmPINController = TextEditingController();

  final _phoneNumberFormKey = GlobalKey<FormState>();
  final _nameFormKey = GlobalKey<FormState>();
  final _emailFormKey = GlobalKey<FormState>();
  final _createPINFormKey = GlobalKey<FormState>();
  final _confirmPINFormKey = GlobalKey<FormState>();

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
                labelText: "Name",
                hintText: "Name",
                controller: _nameController,
                formKey: _nameFormKey,
                validator: (String? values) {},
                onChanged: (String values) {},
              ),
              SizedBox(
                height: MySize.size18,
              ),
              _customInputField(
                labelText: "Phone Number",
                hintText: "Phone Number",
                controller: _phoneNumberController,
                formKey: _phoneNumberFormKey,
                validator: (String? values) {},
                onChanged: (String values) {},
              ),
              SizedBox(
                height: MySize.size18,
              ),
              _customInputField(
                labelText: "Email Optional",
                hintText: "Email Optional",
                controller: _emailController,
                formKey: _emailFormKey,
                validator: (String? values) {},
                onChanged: (String values) {},
              ),
              SizedBox(
                height: MySize.size18,
              ),
              _customInputField(
                labelText: "Create PIN",
                hintText: "Create PIN",
                controller: _createPINController,
                formKey: _createPINFormKey,
                validator: (String? values) {},
                onChanged: (String values) {},
              ),
              SizedBox(
                height: MySize.size18,
              ),
              _customInputField(
                labelText: "Confirm PIN",
                hintText: "Confirm PIN",
                controller: _confirmPINController,
                formKey: _confirmPINFormKey,
                validator: (String? values) {},
                onChanged: (String values) {},
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
              // color: AppColors.darkRoundedButtonColor,
            ),
          ),
          onPressed: () async {}),
    );
  }
}
