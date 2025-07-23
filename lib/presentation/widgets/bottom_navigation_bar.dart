import 'package:auto_route/auto_route.dart';
import 'package:remittance/app/config/route/routes.gr.dart';

enum BottomNavRoute { home, report, stock, order }

class BottomNavWidget {
  final String path;
  final String title;
  final int index;
  final PageRouteInfo<dynamic> route;
  final bool Function() haveAccess;

  BottomNavWidget({
    required this.path,
    required this.title,
    required this.index,
    required this.route,
    required this.haveAccess,
  });
}

Map<BottomNavRoute, BottomNavWidget> drawerRoutesMap = {
  BottomNavRoute.home: BottomNavWidget(
    path: LandingRoute.name,
    title: 'homePage',
    index: 0,
    route:  LandingRoute(),
    haveAccess: () => true,
  ),
  BottomNavRoute.report: BottomNavWidget(
    path: AccountRoute.name,
    title: 'account',
    index: 1,
    route: const AccountRoute(),
    haveAccess: () => true,
  ),
  BottomNavRoute.stock: BottomNavWidget(
    path: WalletRoute.name,
    title: 'wallet',
    index: 2,
    route: const WalletRoute(),
    haveAccess: () => true,
  ),
  BottomNavRoute.order: BottomNavWidget(
    path: ProfileRoute.name,
    title: 'profile',
    index: 3,
    route: const ProfileRoute(),
    haveAccess: () => true,
  ),
};