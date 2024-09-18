import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/appbar/app_bar.dart';
import 'package:my_store/common/widgets/images/app_circular_image.dart';
import 'package:my_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:my_store/common/widgets/texts/section_heading.dart';
import 'package:my_store/features/personalization/controllers/user_controller.dart';
import 'package:my_store/features/personalization/screens/profile/change_name.dart';
import 'package:my_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
        appBar: AppAppBar(
          showBackArrow: true,
          backgroundColor: AppHelperFunctions.isDarkMode(context)
              ? AppColors.dark
              : AppColors.white,
          title: Text("Profile",
              style: Theme.of(context).textTheme.headlineMedium),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : AppImages.user;
                      return controller.imageUploading.value == true
                          ? const AppShimmerEffect(
                              width: 80, height: 80, radius: 80)
                          : AppCircularImage(
                              image: image,
                              isNetworkImage: networkImage.isNotEmpty,
                              height: 80,
                              width: 80,
                              padding: 0);
                    }),
                    TextButton(
                        onPressed: () {
                          controller.uploadUserProfilePicture();
                        },
                        child: const Text("Change Profile Image")),
                    const SizedBox(height: AppSizes.spaceBtwItems / 2),
                    const Divider(),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    const AppSectionHeading(title: "Profile Information"),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    ProfileMenu(
                      title: "Name",
                      value: controller.user.value.fullName,
                      onPressed: () {
                        Get.to(const ChangeNameScreen());
                      },
                    ),

                    ProfileMenu(
                        title: 'Username',
                        value: controller.user.value.username,
                        onPressed: () {}),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: AppSizes.spaceBtwItems),

                    /// Heading Personal Info
                    const AppSectionHeading(
                      title: 'Personal Information',
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    ProfileMenu(
                      title: 'User ID',
                      value: controller.user.value.id,
                      onPressed: () {},
                      icon: Iconsax.copy,
                    ),
                    ProfileMenu(
                        title: 'E-mail',
                        value: controller.user.value.email,
                        onPressed: () {}),
                    ProfileMenu(
                        title: 'Phone Number',
                        value: controller.user.value.phoneNumber,
                        onPressed: () {}),
                    ProfileMenu(
                        title: 'Gender', value: 'Male', onPressed: () {}),
                    ProfileMenu(
                        title: 'Date of Birth',
                        value: '10 Oct, 1994',
                        onPressed: () {}),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    const Divider(),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            controller.deleteAccountWarningPopup();
                          },
                          child: const Text(
                            "Delete Account",
                            style: TextStyle(color: Colors.red),
                          )),
                    )
                  ],
                ),
              )),
        ));
  }
}
