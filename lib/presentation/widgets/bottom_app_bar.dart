import 'package:flutter/material.dart';
import 'package:remittance/app/config/extensions/them_extention.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';
import '../../app/thems/colors.dart';

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    Key? key,
    required this.items,
    required this.onTabSelected,
    required this.currentSelectedIndex,
    this.centerItemText,
  }) : super(key: key) {
    assert(items.length == 2 || items.length == 4);
  }
  final List<FABBottomAppBarItem> items;
  final String? centerItemText;
  final ValueChanged<int> onTabSelected;
  final int currentSelectedIndex;
  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

const _bottomBarHeight = 57.0;
class FABBottomAppBarState extends State<FABBottomAppBar> {
  _updateIndex(int index) {
    widget.onTabSelected(index);
    // getIt<SelectedCategoryCubit>().clearSelectedCategory();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 7,
      // color: AppColors.danger,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildTabItem({required FABBottomAppBarItem item, required int index, required ValueChanged<int> onPressed,}) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.darkGrey, // Set your desired border color
              width: 0.25, // Set the thickness of the border
            ),
          ),
        ),
        height: _bottomBarHeight,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(item.imageUrl??"",
                  width: MySize.size24,
                  height: MySize.size24,
                  color: widget.currentSelectedIndex == index ? AppColors.primary : AppColors.darkGrey,
                  ),
                // Icon(
                //   item.iconData,color:widget.currentSelectedIndex == index ? AppColors.white : AppColors.darkGrey,
                //   size:MySize.size24,
                // ),
                // item.text != null ? Text(
                //   item.text!,
                //   style: TextStyle(color: widget.currentSelectedIndex == index ? AppColors.blue : AppColors.lightGrey),
                // ) : Container(),
                SizedBox(height: MySize.size2,),
                item.text != null ?TextWidgetText.textWidget(
                  text: item.text??"",
                  themeData: context.themeData.textTheme.displaySmall!,
                  fontSize: MySize.size8,
                  color: widget.currentSelectedIndex == index ? AppColors.primary : AppColors.darkGrey,
                  fontWeight: 400,
                  textAlign: TextAlign.center,
                ):Container(),
                // widget.currentSelectedIndex == index?Container(
                //   color: AppColors.white,
                //   height: MySize.size3,
                //   width: MySize.size30,):Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text, this.isCart,this.imageUrl});
  IconData? iconData;
  String? imageUrl;
  String? text;
  bool? isCart;
}
