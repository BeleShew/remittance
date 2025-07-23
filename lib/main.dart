import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:remittance/app/config/route/routes.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/app/thems/thems.dart';
import 'package:remittance/app/utils/dependencies.dart';

void main() {
 WidgetsFlutterBinding.ensureInitialized();
  Dependencies.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return MaterialApp.router(
      title: 'Remittance',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getDarkTheme(),
      routerConfig: _appRouter.config(),
      builder: EasyLoading.init(),
    );
  }
}

