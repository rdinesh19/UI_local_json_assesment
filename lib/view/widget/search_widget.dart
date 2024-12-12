import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constats/color.dart';

Widget searchWidget(bool listEmpty,double? height,double?borderRadius,borderColor,hintText,searchController,hintStyle,Function(String)? onChanged,prefixIcon,suffixIcon){
  return  Container(
    height:height??50.h,
    margin: EdgeInsets.only(left: !listEmpty?28.w:49.w,right: !listEmpty?27.w:49.w,top:!listEmpty?37.w: 28.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius??12),
        border: Border.all(color:borderColor)
    ),

    child: TextField(
      controller: searchController,
      onChanged: onChanged,
      decoration: InputDecoration(
          prefixIcon: prefixIcon??const SizedBox(),
          suffixIcon: suffixIcon??const SizedBox(),
          hintText:hintText ,
          hintStyle:hintStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius??12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: ColorRes.white
      ),
    ),
  );
}