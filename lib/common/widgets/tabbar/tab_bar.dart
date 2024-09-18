import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/device/device_utility.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTabBar({super.key, required this.tabs});

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Material(
        color: dark ? AppColors.dark : AppColors.white,
        child: TabBar(
          tabs: tabs,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicatorColor: AppColors.primary,
          labelColor: dark ? AppColors.white : AppColors.primary,
          unselectedLabelColor: AppColors.darkGrey,
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
