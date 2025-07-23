import 'package:flutter/material.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/app/utils/enums.dart';

class AnimatedSnackBar extends StatefulWidget {
  const AnimatedSnackBar(
      {super.key,
      required this.message,
      this.backgroundColor,
      this.textColor,
      this.showCloseIcon,
      required this.onDismiss,
        this.transitionType = PageTransitionType.rightToLeft,
      this.closeIconColor});
  @override
  State<AnimatedSnackBar> createState() => _AnimatedSnackBarState();
  final String message;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? closeIconColor;
  final bool? showCloseIcon;
  final VoidCallback onDismiss;
  final PageTransitionType transitionType;
}

class _AnimatedSnackBarState extends State<AnimatedSnackBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset>? _offsetAnimation;
  late Animation<double>? _fadeAnimation;
  late Animation<double>? _scaleAnimation;
  late Animation<double>? _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _initializeAnimation();
    _controller.forward();
  }

  void _initializeAnimation() {
    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    switch (widget.transitionType) {
      case PageTransitionType.fade:
        _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation);
        break;
      case PageTransitionType.circular:
        _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut,);
        _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0,).animate(curvedAnimation);
        break;
      case PageTransitionType.scale:
        _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(curvedAnimation);
        break;
      case PageTransitionType.rotate:
        _rotationAnimation = Tween<double>(begin: -0.5, end: 0.0).animate(curvedAnimation);
        break;
      case PageTransitionType.rightToLeft:
        _offsetAnimation = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(curvedAnimation);
        break;
      case PageTransitionType.leftToRight:
        _offsetAnimation = Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(curvedAnimation);
        break;
      case PageTransitionType.topToBottom:
        _offsetAnimation = Tween<Offset>(
          begin: const Offset(0.0, -1.0),
          end: Offset.zero,
        ).animate(curvedAnimation);
        break;
      case PageTransitionType.bottomToTop:
        _offsetAnimation = Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(curvedAnimation);
        break;
      default:
        _offsetAnimation = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(curvedAnimation);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void dismissSnackBar() {
    _controller.reverse().then((_) => widget.onDismiss());
  }

  @override
  Widget build(BuildContext context) {
    Widget animatedChild;
    switch (widget.transitionType) {
      case PageTransitionType.fade:
        animatedChild = FadeTransition(
          opacity: _fadeAnimation!,
          child: _snackBarContent(),
        );
        break;

      case PageTransitionType.scale:
        animatedChild = ScaleTransition(
          scale: _scaleAnimation!,
          child: _snackBarContent(),
        );
        break;

      case PageTransitionType.rotate:
        animatedChild = RotationTransition(
          turns: _rotationAnimation!,
          child: _snackBarContent(),
        );
        break;

      case PageTransitionType.circular:
        animatedChild = FadeTransition(
          opacity: _fadeAnimation!,
          child: ScaleTransition(
            scale: _scaleAnimation!,
            child: _snackBarContent(),
          ),
        );
        break;

      default:
        animatedChild = SlideTransition(
          position: _offsetAnimation ?? const AlwaysStoppedAnimation(Offset.zero),
          child: _snackBarContent(),
        );
        break;
    }
    return animatedChild;
  }

  Widget _snackBarContent() {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: MySize.size5??0),
        padding: EdgeInsets.symmetric(vertical: MySize.size5??0,horizontal: MySize.size10??0),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.black,
          borderRadius: BorderRadius.circular(MySize.size8??0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _messageWidget(),
            if (widget.showCloseIcon ?? false) _closeIconWidget(),
          ],
        ),
      ),
    );
  }

  Widget _closeIconWidget() {
    return Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: dismissSnackBar,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Icon(
            Icons.cancel,
            size: 30,
            color: widget.closeIconColor ?? AppColors.danger,
          ),
        ),
      ),
    );
  }

  Widget _messageWidget() {
    return Flexible(
      child: Text(
        widget.message,
        style: TextStyle(
          color: widget.textColor ?? Colors.white, // Add default text color
          fontSize: 16,
        ),
      ),
    );
  }
}
