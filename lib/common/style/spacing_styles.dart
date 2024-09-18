import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/sizes.dart';

class AppSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
      top: AppSizes.appBarHeight,
      bottom: AppSizes.defaultSpace,
      left: AppSizes.defaultSpace,
      right: AppSizes.defaultSpace);
}
