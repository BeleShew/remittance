import 'package:flutter/material.dart';
class VisibilityToggle extends StatelessWidget {
  final bool isVisible;
  final Color? iconColor;
  final VoidCallback onToggle;

  const VisibilityToggle({
    super.key,
    required this.isVisible,
    this.iconColor,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onToggle,
      child: Icon(isVisible ? Icons.visibility : Icons.visibility_off,color: iconColor,),
    );
  }
}
