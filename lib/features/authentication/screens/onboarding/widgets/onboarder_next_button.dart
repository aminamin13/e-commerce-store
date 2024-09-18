import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/device/device_utility.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;

    final dark = AppHelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: AppDeviceUtils.getBottomNavigationBarHeight(),
        right: AppSizes.defaultSpace,
        child: ElevatedButton(
          onPressed: () {
            controller.nextPage();
          },
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? AppColors.primary : AppColors.black),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}
