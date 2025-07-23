import 'package:flutter/material.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/app/thems/size_config.dart';
import 'package:remittance/presentation/widgets/text_widget.dart';

class MenuPopUp extends StatefulWidget {
  MenuPopUp({
    super.key,
    this.backgroundColor,
    required this.text,
    required this.popUpList,
    required this.callback,
    this.textColor,
    this.leftMargin,
    this.rightMargin,
  });

  String text;
  List<Item> popUpList;
  final double? leftMargin;
  final double? rightMargin;
  final Color? backgroundColor;
  final Color? textColor;
  final Function(Item) callback;

  @override
  State<MenuPopUp> createState() => _MenuPopUpState();
}

class _MenuPopUpState extends State<MenuPopUp> {
  OverlayEntry? _overlayEntry;
  bool _isOverlayVisible = false;
  final GlobalKey _widgetKey = GlobalKey();
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleOverlay,
      child: Container(
        key: _widgetKey,
        height: 50, // Adjust the height as needed
        decoration: BoxDecoration(
          color: const Color(0xffF1F1F1),
          borderRadius: _isOverlayVisible
              ? const BorderRadius.only(
            topRight: Radius.circular(5),
            topLeft: Radius.circular(5),
          )
              : const BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(_selectedValue ?? widget.text,
                  style: TextWidgetText.textWidgetStyle(
                    themeData: Theme.of(context).textTheme.displaySmall!,
                    fontWeight:_selectedValue!=null? 500:400,
                    fontSize:_selectedValue!=null? MySize.size16:MySize.size14,
                    color: AppColors.black
                ),),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10), // Adjust the padding as needed
                child: Icon(
                  _isOverlayVisible
                      ? Icons.keyboard_arrow_up_outlined
                      : Icons.keyboard_arrow_down_outlined,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleOverlay() {
    if (_isOverlayVisible) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    }
    setState(() {
      _isOverlayVisible = !_isOverlayVisible;
    });
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = _widgetKey.currentContext?.findRenderObject() as RenderBox?;
    final offset = renderBox?.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;
    final availableHeightBelow = screenHeight - (offset?.dy ?? 0) - renderBox!.size.height;
    final availableHeightAbove = offset?.dy ?? 0;
    final isEnoughSpaceBelow = availableHeightBelow > availableHeightAbove;

    final topOffset = isEnoughSpaceBelow
        ? (offset?.dy ?? 0) + renderBox.size.height
        : null;
    final bottomOffset = isEnoughSpaceBelow
        ? null
        : screenHeight - (offset?.dy ?? 0);

    return OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: _toggleOverlay,
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                left: widget.leftMargin ?? 10,
                right: widget.rightMargin ?? 10,
                top: topOffset,
                bottom: bottomOffset,
                child: Material(
                  color: widget.backgroundColor ?? Colors.blueGrey,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Divider(color: Colors.blue, height: 2),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: isEnoughSpaceBelow
                                ? availableHeightBelow * 0.65
                                : availableHeightAbove * 0.65,
                          ),
                          child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(0),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.popUpList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  onTap: () {
                                    setState(() {
                                      _selectedValue = widget.popUpList[index].name;
                                    });
                                    widget.callback(widget.popUpList[index]);
                                    _overlayEntry?.remove();
                                    _overlayEntry = null;
                                    setState(() {
                                      _isOverlayVisible = false;
                                    });
                                  },
                                  title: Text(widget.popUpList[index].name??"",
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Item{
  int? id;
  String? name;
  String? symbol;
  String? description;
  String? code;

  Item({
    this.id,
    this.name,
    this.symbol,
    this.description,
    this.code,
  });
}