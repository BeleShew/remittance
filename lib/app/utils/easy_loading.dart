import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import '../thems/colors.dart';

class EasyLoadingWidget{
  static Future init()async{
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..maskType = EasyLoadingMaskType.custom
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 60.0
      ..indicatorWidget =
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Colors.white38,
          color: AppColors.superLightGrey.withOpacity(0.9),
        ),
        height: 100,
        width: 100,
        child: Lottie.asset(
          'assets/animations/loading_aimation.json',
        ),
      )
      ..radius = 100.0
      ..progressColor = AppColors.primary
      ..backgroundColor = Colors.transparent
      ..indicatorColor = AppColors.primary
      ..textColor = Colors.white
      ..maskColor = Colors.black45
      ..userInteractions = false
      ..dismissOnTap = false
      ..boxShadow = <BoxShadow>[]
      ..customAnimation = CustomAnimation();
  }

}
class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
      Widget child,
      AnimationController controller,
      AlignmentGeometry alignment,) {
    double opacity = controller.value; //controller?.value ?? 0;
    return Opacity(
      opacity: opacity,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}