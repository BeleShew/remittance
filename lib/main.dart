import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/app/config/route/routes.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/app/thems/thems.dart';
import 'package:remittance/app/utils/dependencies.dart';
import 'package:remittance/presentation/riverpod/theme/theme_mode_provider.dart';

void main() {
 WidgetsFlutterBinding.ensureInitialized();
  Dependencies.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MySize().init(context);

    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'Remittance',
      debugShowCheckedModeBanner: false,
      // Correctly assign the light theme to `theme`
      theme: AppTheme.getTheme(), // 👈 FIX: Should be your light theme
      // Correctly assign the dark theme to `darkTheme`
      darkTheme: AppTheme.getDarkTheme(), // 👈 FIX: Should be your dark theme
      themeMode: themeMode,
      routerConfig: _appRouter.config(),
      builder: EasyLoading.init(),
    );
  }
}


