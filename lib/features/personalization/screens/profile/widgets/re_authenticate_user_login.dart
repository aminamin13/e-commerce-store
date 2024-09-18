import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/common/widgets/appbar/app_bar.dart';
import 'package:my_store/features/personalization/controllers/user_controller.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:my_store/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        backgroundColor: AppHelperFunctions.isDarkMode(context)
            ? AppColors.dark
            : AppColors.white,
        title: Text("Re-Authenticate User",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: (value) =>
                        AppValidator.validateEmptyText("Email", value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: AppTexts.email,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  Obx(() => TextFormField(
                        controller: controller.verifyPassword,
                        validator: (value) =>
                            AppValidator.validateEmptyText("Password", value),
                        expands: false,
                        obscureText: controller.hidePassword.value,
                        decoration: InputDecoration(
                          labelText: AppTexts.password,
                          prefixIcon: const Icon(Iconsax.key),
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.hidePassword.value =
                                    !controller.hidePassword.value;
                              },
                              icon: Icon(controller.hidePassword.value
                                  ? Iconsax.eye
                                  : Iconsax.eye_slash)),
                        ),
                      )),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>
                          controller.reAuthenticateEmailAndPassword(),
                      child: const Text("Verify"),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
