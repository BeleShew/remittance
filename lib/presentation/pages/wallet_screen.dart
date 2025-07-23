import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remittance/presentation/widgets/app_bar.dart';

@RoutePage()
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(elevation: 1,title: Text("Wallet Screen"),centerTitle: true,),
      body: Center(child: Text("Wallet Screen"),),
    );
  }
}