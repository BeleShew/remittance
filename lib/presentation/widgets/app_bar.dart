import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
   const AppBarWidget({super.key,this.showLeadingWidget=true, this.elevation=0,this.title,this.centerTitle,this.leading=const Icon(Icons.arrow_back_ios_sharp),this.actions});
   final double? elevation;
   final bool? centerTitle;
   final bool? showLeadingWidget;
   final Widget? title;
   final Widget leading;
   final List<Widget>? actions;
   @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      title:title,
      centerTitle: centerTitle,
      leading:showLeadingWidget??false? InkWell(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: leading,
        onTap: ()=>context.router.back(),
      ):Container(),
      actions: actions,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}



