import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/presentation/widgets/bottom_navigation_bar.dart';
import '../widgets/bottom_app_bar.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final routes = drawerRoutesMap.values.map((bottomNav) => bottomNav.route).toList();
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      animationDuration: Duration.zero,
      backgroundColor: AppColors.black,
      routes: routes,
      bottomNavigationBuilder: (context, tabsRouter) => FABBottomAppBar(
        onTabSelected: tabsRouter.setActiveIndex,
        currentSelectedIndex: tabsRouter.activeIndex,
        items: [
          FABBottomAppBarItem(text: "home",imageUrl: "assets/images/home.png"),
          FABBottomAppBarItem(text: "reward",imageUrl: "assets/images/loyal_customer.png"),
          FABBottomAppBarItem(text: "scan",imageUrl: "assets/images/scan.png"),
          FABBottomAppBarItem(text: "more",imageUrl: "assets/images/more.png"),
        ],
      ),
    );
  }
}