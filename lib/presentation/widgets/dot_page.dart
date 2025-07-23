import 'package:flutter/material.dart';
import 'package:remittance/app/thems/colors.dart';
class DotRow extends StatelessWidget {
  DotRow({
    Key? key,
    this.color = AppColors.primary,
    this.normal = false,
    this.height = 5.0,
    this.dotSize = 5.0,
    this.spacing = 2.0,
    this.paddingHorizontal = 10.0,
  }) : super(key: key);

  final Color color;
  final bool normal;
  final double height;
  final double dotSize;
  final double spacing;
  final double paddingHorizontal;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dotWithSpacing = dotSize + (normal ? 0 : spacing);
    // final numberOfDots = (screenWidth / dotWithSpacing).floor();
    final numberOfDots = ((screenWidth - paddingHorizontal) / dotWithSpacing).floor();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(numberOfDots, (index) => Container(
        margin: EdgeInsets.symmetric(horizontal: normal ? 0 : spacing / 2),
        width: dotSize,
        height: height,
        decoration: BoxDecoration(
          color: color,
          shape: normal ? BoxShape.rectangle : BoxShape.circle,
        ),
      ),
      ),
    );
  }
}


