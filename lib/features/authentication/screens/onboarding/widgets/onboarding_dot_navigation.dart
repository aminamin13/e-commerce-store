import 'package:flutter/material.dart';
import 'package:my_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/device/device_utility.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final dark = AppHelperFunctions.isDarkMode(context);

    return Positioned(
        bottom: AppDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: AppSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pagecontroller,
          onDotClicked: (index) {
            controller.dotNavigationClick(index);
          },
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? AppColors.light : AppColors.dark,
              dotHeight: 6),
        ));
  }
}
