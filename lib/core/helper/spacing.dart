import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox verticalSpace(double height) => SizedBox(height: height.h);

SizedBox horizontalSpace(double width) => SizedBox(width: width.w);
Container greyLiner(Color? color) =>
    Container(height: 1.h, width: double.infinity, color: color ?? Colors.grey);