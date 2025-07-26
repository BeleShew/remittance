import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    CustomRoute(
        path: '/login',
        initial: true,
        page: LoginRoute.page,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 500,
        transitionsBuilder: circularFadeTransition),
    CustomRoute(
          path: '/main',
          page: HomeRoute.page,
          durationInMilliseconds: 500,
          reverseDurationInMilliseconds: 500,
          transitionsBuilder: circularFadeTransition,
          children: [
            CustomRoute(
                path: '',
                page: LandingRoute.page,
                durationInMilliseconds: 500,
                reverseDurationInMilliseconds: 500,
                transitionsBuilder: circularFadeTransition),
            CustomRoute(
                path: '',
                page: AccountRoute.page,
                durationInMilliseconds: 500,
                reverseDurationInMilliseconds: 500,
                transitionsBuilder: circularFadeTransition),
            CustomRoute(
                path: '',
                page: WalletRoute.page,
                durationInMilliseconds: 500,
                reverseDurationInMilliseconds: 500,
                transitionsBuilder: circularFadeTransition),
            CustomRoute(
                path: '',
                page: ProfileRoute.page,
                durationInMilliseconds: 500,
                reverseDurationInMilliseconds: 500,
                transitionsBuilder: circularFadeTransition),
          ],
        ),
    CustomRoute(
            path: '/createAccountScreen',
            page: CreateAccountRoute.page,
            durationInMilliseconds: 500,
            reverseDurationInMilliseconds: 500,
            transitionsBuilder: circularFadeTransition),
    CustomRoute(
        path: '/notificationScreen',
        page: NotificationRoute.page,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 500,
        transitionsBuilder: circularFadeTransition),
    CustomRoute(
        path: '/sendMoney',
        page: SendMoneyRoute.page,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 500,
        transitionsBuilder: circularFadeTransition),
    CustomRoute(
        path: '/exchangeRateScreen',
        page: ExchangeRateRoute.page,
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 500,
        transitionsBuilder: circularFadeTransition),
  ];
}

Widget circularFadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  // Apply a fade effect
  final fadeAnimation = CurvedAnimation(
    parent: animation,
    curve: Curves.easeInOut,
  );

  // Apply a scaling effect
  final scaleAnimation = Tween<double>(
    begin: 0.0, // Start from invisible (small circle)
    end: 1.0, // Expand to full size
  ).animate(CurvedAnimation(
    parent: animation,
    curve: Curves.easeInOut,
  ));

  return FadeTransition(
    opacity: fadeAnimation,
    child: ScaleTransition(
      scale: scaleAnimation,
      child: child,
    ),
  );
}

Widget customPageTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  const curve = Curves.easeOutQuart;
  var curvedAnimation = CurvedAnimation(parent: animation, curve: curve);
  return FadeTransition(
    opacity: curvedAnimation,
    child: SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0), // From right to left
        end: Offset.zero,
      ).animate(curvedAnimation),
      child: child,
    ),
  );
}
