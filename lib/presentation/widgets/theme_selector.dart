import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/presentation/riverpod/theme/theme_mode_provider.dart';

class ThemeSelectorSheet extends StatelessWidget {
  final WidgetRef ref;

  const ThemeSelectorSheet(this.ref, {super.key});

  @override
  Widget build(BuildContext context) {
    final currentMode = ref.watch(themeModeProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(Icons.light_mode),
          title: Text("Light"),
          trailing: currentMode == ThemeMode.light ? Icon(Icons.check) : null,
          onTap: () {
            ref.read(themeModeProvider.notifier).state = ThemeMode.light;
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: Icon(Icons.dark_mode),
          title: Text("Dark"),
          trailing: currentMode == ThemeMode.dark ? Icon(Icons.check) : null,
          onTap: () {
            ref.read(themeModeProvider.notifier).state = ThemeMode.dark;
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: Icon(Icons.brightness_auto),
          title: Text("System"),
          trailing: currentMode == ThemeMode.system ? Icon(Icons.check) : null,
          onTap: () {
            ref.read(themeModeProvider.notifier).state = ThemeMode.system;
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
