import 'package:flutter/cupertino.dart';

class ItemPickerModel {
  late int id;
  late String name;
  late String value;
  String? imageFlag;
  String? flag;
  IconData? iconFlag;
  late bool isItemSelected;
  bool? showFlag;
  ItemPickerModel({required this.id,required this.name,required this.value,this.isItemSelected=false,this.imageFlag,this.iconFlag,this.flag,this.showFlag});
}