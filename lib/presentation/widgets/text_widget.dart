import 'package:flutter/material.dart';
import 'package:remittance/app/thems/thems.dart';

class TextWidgetText{
  static Widget textWidget({ required String text,required TextStyle themeData,int? fontWeight,double? fontSize,Color? color,
    TextDecoration decoration=TextDecoration.none,
    bool? softWrap,TextOverflow? overflow,
    TextAlign textAlign= TextAlign.start}){
    return Text(
      text,
      style: AppTheme.getTextStyle(
          themeData,
          decoration: decoration,
          fontWeight: fontWeight??500,
          fontSize: fontSize,
          color: color
      ),
      overflow: overflow,
      softWrap: softWrap??false,
      textAlign:textAlign,
    );
  }

  static Widget richTextWidget({ required String text1,required String text2,required TextStyle themeData,int? fontWeight,double? fontSize,Color? color}){
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children:[
          TextSpan(text: text1)
        ],
        style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight:
            FontWeight.w300),
      ),
    );
  }

  static TextStyle textWidgetStyle({required TextStyle themeData,int? fontWeight,double? fontSize,Color? color}){
    return AppTheme.getTextStyle(
        themeData,
        fontWeight: fontWeight??500,
        fontSize: fontSize,
        color: color
    );
  }
}
