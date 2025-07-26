import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/app/config/extensions/them_extention.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/app/utils/enums.dart';
import 'package:remittance/app/utils/helper_methods.dart';
import 'package:remittance/domain/dto/user/login_response.dart';
import 'package:remittance/domain/dto/user/transaction.dart';
import 'package:remittance/presentation/riverpod/user/transaction_provider.dart';
import 'package:remittance/presentation/riverpod/user/userProvider.dart';
import 'package:remittance/presentation/widgets/app_bar.dart';
import 'package:remittance/presentation/widgets/input_field.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';
@RoutePage()
class SendMoneyScreen extends ConsumerStatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  ConsumerState<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends ConsumerState<SendMoneyScreen> {
  // final _formKey = GlobalKey<FormState>();
  final _recipientController = TextEditingController();
  final _emailOrPhoneController = TextEditingController();
  final _bankController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _amountController = TextEditingController();
  String _currency = 'USD';

  final _recipientKey = GlobalKey<FormState>();
  final _emailPhoneKey = GlobalKey<FormState>();
  final _bankKey = GlobalKey<FormState>();
  final _accountKey = GlobalKey<FormState>();
  final _amountKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final user = authState.user;
    return Scaffold(
      appBar:  AppBarWidget(
        showLeadingWidget: true,
        title: Text("Send Money"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextWidgetText.textWidget(
              text: 'Current Balance: ${user?.balance?.toStringAsFixed(2)} ${user?.currency}',
              themeData: context.themeData.textTheme.displaySmall!,
              fontSize: MySize.size18,
              fontWeight: 500,
              textAlign: TextAlign.start,
              // color: AppColors.black,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _textFormWidget(),
                  const SizedBox(height: 16),
                  Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: AppColors.lightBlack
                    ),
                    child: DropdownButtonFormField<String>(
                      value: _currency,
                      iconEnabledColor: Colors.black,
                      onChanged: (val) => setState(() => _currency = val!),
                      items: ['USD', 'EUR', 'ETB'].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                    ),
                  ),
                  SizedBox(height: MySize.size12),
                  ElevatedButton(
                    onPressed: ()=>_handleSendMoney(user),
                    child: const Text('Send'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFormWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextWidgetText.textWidget(
          text: "Recipient Name",
          themeData: context.themeData.textTheme.displaySmall!,
          fontSize: MySize.size18,
          fontWeight: 400,
          textAlign: TextAlign.start,
          // color: AppColors.black,
        ),
        Form(
          key: _recipientKey,
          child: InputTextFormField(
            controller: _recipientController,
            isBordered: true,
            textAlign: TextAlign.start,
            hintText: "Recipient Name",
            validator: (value) => value == null || value.isEmpty ? 'Required' : null,
            onChanged: (_) => _validateFormKey(_recipientKey),
          ),
        ),
        SizedBox(height: MySize.size12),
        TextWidgetText.textWidget(
          text: "Email",
          themeData: context.themeData.textTheme.displaySmall!,
          fontSize: MySize.size18,
          fontWeight: 400,
          textAlign: TextAlign.start,
          // color: AppColors.black,
        ),
        Form(
          key: _emailPhoneKey,
          child: InputTextFormField(
            controller: _emailOrPhoneController,
            isBordered: true,
            textAlign: TextAlign.start,
            hintText: "Email",
            validator: (value) =>isEmail(_emailOrPhoneController.text)?null:"Enter valid email",
            onChanged: (_) => _validateFormKey(_emailPhoneKey),
          ),
        ),
        SizedBox(height: MySize.size12),

        TextWidgetText.textWidget(
          text: "Bank Name",
          themeData: context.themeData.textTheme.displaySmall!,
          fontSize: MySize.size18,
          fontWeight: 400,
          textAlign: TextAlign.start,
          // color: AppColors.black,
        ),
        Form(
          key: _bankKey,
          child: InputTextFormField(
            controller: _bankController,
            isBordered: true,
            labelText: "Bank Name",
            textAlign: TextAlign.start,
            hintText: "Bank Name",
            validator: (value) => value == null || value.isEmpty ? 'Required' : null,
            onChanged: (_) => _validateFormKey(_bankKey),
          ),
        ),
        SizedBox(height: MySize.size12),

        TextWidgetText.textWidget(
          text: "Account Number",
          themeData: context.themeData.textTheme.displaySmall!,
          fontSize: MySize.size18,
          fontWeight: 400,
          textAlign: TextAlign.start,
          // color: AppColors.black,
        ),
        Form(
          key: _accountKey,
          child: InputTextFormField(
            controller: _accountNumberController,
            isBordered: true,
            textAlign: TextAlign.start,
            hintText: "Account Number",
            keyboardType: TextInputType.number,
            validator: (value) => value == null || value.isEmpty ? 'Required' : null,
            onChanged: (_) => _validateFormKey(_accountKey),
          ),
        ),
        SizedBox(height: MySize.size12),

        TextWidgetText.textWidget(
          text: "Amount",
          themeData: context.themeData.textTheme.displaySmall!,
          fontSize: MySize.size18,
          fontWeight: 400,
          textAlign: TextAlign.start,
          // color: AppColors.black,
        ),
        Form(
          key: _amountKey,
          child: InputTextFormField(
            controller: _amountController,
            isBordered: true,
            textAlign: TextAlign.start,
            hintText: "Amount",
            keyboardType: TextInputType.number,
            validator: (value) => value == null || value.isEmpty ? 'Required' : null,
            onChanged: (_) => _validateFormKey(_amountKey),
          ),
        ),
        SizedBox(height: MySize.size12),
      ],
    );
  }
  void _showSnack(String message) {
    showAnimatedSnackBar(
      message: message,
      context: context,
      showCloseIcon: true,
    );
  }
  bool _allFormsValid() {
    return _validateFormKey(_recipientKey) &&
        _validateFormKey(_emailPhoneKey) &&
        _validateFormKey(_bankKey) &&
        _validateFormKey(_accountKey) &&
        _validateFormKey(_amountKey);
  }
  bool _validateFormKey(GlobalKey<FormState> formKey) {
    return formKey.currentState!.validate();
  }
  void _handleSendMoney(LoginResponse? user) async {
    try {
      FocusScope.of(context).unfocus();
      if (!_allFormsValid()) return;
      EasyLoading.show();
      final enteredAmount = double.parse(_amountController.text);
      final currentBalance = user?.balance ?? 0;

      if (enteredAmount > currentBalance) {
        _showSnack("Insufficient balance");
        EasyLoading.dismiss();
        return;
      }

      if (_currency != user?.currency) {
        _showSnack("You have selected a different currency than your balance");
        EasyLoading.dismiss();
        return;
      }

      final notifier = ref.read(authNotifierProvider.notifier);
      final recipient = await notifier.getUser(_emailOrPhoneController.text);

      if (recipient.email == null || recipient.accountNumber == null||recipient.accountNumber!=_accountNumberController.text) {
        _showSnack("User account not found. Please confirm this user has an account.");
        EasyLoading.dismiss();
        return;
      }
      if (user?.id?.toUpperCase()== recipient.id?.toUpperCase()) {
        _showSnack("You have try to transfer the money with you. please enter other account");
        EasyLoading.dismiss();
        return;
      }
      final newSenderBalance = currentBalance - enteredAmount;
      final newRecipientBalance = (recipient.balance ?? 0) + enteredAmount;
      final transactionId = DateTime.now().millisecondsSinceEpoch.toString();
      final timestamp = DateTime.now();

      await notifier.updateUser(user?.email ?? "", newSenderBalance);
      await notifier.updateUser(recipient.email ?? "", newRecipientBalance);

      await notifier.transactions(
        TransactionModel(
          senderId: user?.id,
          receiverId: recipient.id,
          transactionId: transactionId,
          amount: enteredAmount,
          currency: _currency,
          timestamp: timestamp,
          status: enumToString(TransactionStatus.sent)
        ),
      );
       ref.invalidate(transactionDataProvider);
      context.router.popForced();
      _showSnack("Successfully transferred");
      notifier.refreshLoggedInUser(user?.email??"");
      EasyLoading.dismiss();
    } on Exception catch (e) {
      debugPrint(e.toString());
      EasyLoading.dismiss();
    }
  }
}
