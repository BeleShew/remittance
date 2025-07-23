import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remittance/presentation/widgets/app_bar.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(elevation: 1,title: Text("Account Screen"),centerTitle: true,),
      body: Center(child: Text("Account Screen"),),
    );
  }
}