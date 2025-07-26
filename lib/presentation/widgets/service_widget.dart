import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remittance/app/config/extensions/them_extention.dart';
import 'package:remittance/app/config/route/routes.gr.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/app/utils/helper_methods.dart';
import 'package:remittance/domain/dto/shared/services_model.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';
import 'package:remittance/presentation/widgets/transaction_widget.dart';

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({super.key,});

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  List<ServicesModel> servicesList = [
    ServicesModel(headerTitle: "eTransfer",
      details: [
      ServiceDetails(
        servicesDetailsCallBack: "sendMoney",
        title: "Send",
        imageUrl: "assets/images/send_money.png",
      ),
      ServiceDetails(
        title: "Convert",
        servicesDetailsCallBack: "convert",
        imageUrl: "assets/images/convert.png",
      ),
      ServiceDetails(
        title: "Exchange",
        servicesDetailsCallBack: "exchange",
        imageUrl: "assets/images/currency.png",
      ),
      ServiceDetails(
        title: "Borrowing",
        imageUrl: "assets/images/borrow.png",
        servicesDetailsCallBack: "borrowing",
      ),
      ServiceDetails(
        title: "Merchant",
        servicesDetailsCallBack: "merchant",
        imageUrl: "assets/images/merchant.png",
      ),
      ServiceDetails(
        title: "Airtime",
        servicesDetailsCallBack: "airtimeTop",
        imageUrl: "assets/images/airtime.png",
      ),
    ],
    ),
    ServicesModel(
      headerTitle: "Pay Bills",
    ),
    ServicesModel(
      headerTitle: "Deposit",
    ),
    ServicesModel(headerTitle: "Request Money",
    ),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  servicesList[currentIndex].details != null && servicesList[currentIndex].details!.isNotEmpty ? _buildServiceDetailsWidget(servicesList[currentIndex].details) : _buildServicesEmptyWidget(),
                  SizedBox(height: MySize.size5,),
                  const TransactionWidget()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceDetailsWidget(List<ServiceDetails>? details) {
    return GridView.count(
      crossAxisCount: 3,
      scrollDirection: Axis.vertical,
      crossAxisSpacing: MySize.size8 ?? 0,
      mainAxisSpacing: MySize.size8 ?? 0,
      padding: EdgeInsets.all(MySize.size8 ?? 0),
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Disables internal scrolling
      children: List.generate(details?.length ?? 0,
          (detailsIndex) {
        return InkWell(
          onTap: () {
            _handleServiceAction(details?[detailsIndex].servicesDetailsCallBack??"");
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MySize.size14 ?? 0, vertical: MySize.size24 ?? 0),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark ? AppColors.lightBlack : AppColors.lightestGrey,
              borderRadius: BorderRadius.all(Radius.circular(MySize.size12 ?? 0)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                details?[detailsIndex].imageUrl!=null && details![detailsIndex].imageUrl!.isNotEmpty?
                    Image.asset(details[detailsIndex].imageUrl??"",
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ) : Icon(Icons.shopping_cart_checkout_outlined, size: MySize.size30),
                SizedBox(height: MySize.size10),
                Flexible(
                  child: TextWidgetText.textWidget(
                    text:details?[detailsIndex].title ?? "",
                    themeData: context.themeData.textTheme.displaySmall!,
                    fontSize: MySize.size14,
                    fontWeight: 500,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildServicesEmptyWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MySize.size8 ?? 0, vertical: MySize.size10 ?? 0),
        child: TextWidgetText.textWidget(
          text: "currentlyThereIsNoAvailableServices",
          themeData: context.themeData.textTheme.displaySmall!,
          fontSize: MySize.size14,
          fontWeight: 500,
          textAlign: TextAlign.start,
          // color: AppColors.black,
        ),
      ),
    );
  }

  void _handleServiceAction(String callback,)async {
    switch (callback) {
      case 'sendMoney':
        try {
          context.router.push(SendMoneyRoute());
          // final isDevMode = await PlatformChannelHandler.platform.invokeMethod("isDevMode");
          // print("Development Mode Enabled: $isDevMode");
          //
          // final isRooted = await PlatformChannelHandler.platform.invokeMethod("rooted");
          // print("Rooted Mode Enabled: $isRooted");
          //
          // final isEmulate = await PlatformChannelHandler.platform.invokeMethod("emulate");
          // print("Emulate Mode Enabled: $isEmulate");
        } catch (e) {
          print("Error checking dev mode: $e");
        }
        // context.router.push(const CreateAccountRoute());
        break;
      case 'convert':
        _showNotImplementedMessage();
        break;
      case 'exchange':
        context.router.push(ExchangeRateRoute());
        break;
      case 'borrowing':
        _showNotImplementedMessage();
        break;
      case 'merchant':
        _showNotImplementedMessage();
        break;
      case 'airtimeTop':
        _showNotImplementedMessage();
        break;
      default:
        _showNotImplementedMessage();
    }
  }
  void _showNotImplementedMessage() {
    showAnimatedSnackBar(
      message: "This service is currently not implemented.",
      context: context,
      showCloseIcon: true,
    );
  }
}
