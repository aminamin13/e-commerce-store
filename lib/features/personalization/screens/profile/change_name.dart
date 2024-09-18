import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/appbar/app_bar.dart';
import 'package:my_store/features/personalization/controllers/update_name_controller.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:my_store/utils/validators/validation.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        backgroundColor: AppHelperFunctions.isDarkMode(context)
            ? AppColors.dark
            : AppColors.white,
        title: Text("Change Name",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            Text(
                "Use Real Name for Easy Verification. This name will appear on several Pages",
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        AppValidator.validateEmptyText("First Name", value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: AppTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        AppValidator.validateEmptyText("Last Name", value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: AppTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          controller.updateUserName();
                        },
                        child: const Text(
                          "Save",
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
