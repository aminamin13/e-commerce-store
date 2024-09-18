import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/authentication/controllers/signin/login_controller.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';

class SocailMediaLogin extends StatelessWidget {
  const SocailMediaLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
              onPressed: () {
                controller.googleSignIn();
              },
              icon: const Image(
                  width: AppSizes.iconMd,
                  height: AppSizes.iconMd,
                  image: AssetImage(AppImages.google)),
            )),
        const SizedBox(
          width: AppSizes.spaceBtwItems,
        ),
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: AppSizes.iconMd,
                  height: AppSizes.iconMd,
                  image: AssetImage(AppImages.facebook)),
            )),
      ],
    );
  }
}
