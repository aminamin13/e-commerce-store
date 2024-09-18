import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/authentication/controllers/signin/login_controller.dart';
import 'package:my_store/features/authentication/screens/password_config/forget_password.dart';
import 'package:my_store/features/authentication/screens/signup/signup.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:my_store/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            // email

            TextFormField(
                controller: controller.email,
                validator: (value) {
                  return AppValidator.validateEmptyText("Email", value);
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: AppTexts.email,
                )),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),
            Obx(() => TextFormField(
                controller: controller.password,
                validator: (value) {
                  return AppValidator.validateEmptyText('password', value);
                },
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: AppTexts.password,
                    suffixIcon: IconButton(
                      icon: const Icon(Iconsax.eye_slash),
                      onPressed: () {
                        controller.hidePassword.value =
                            !controller.hidePassword.value;
                      },
                    )))),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.rememberMe.value = value!;
                        })),
                    const Text(AppTexts.rememberMe)
                  ],
                ),
                TextButton(
                    onPressed: () {
                      Get.to(const ForgetPasswordScreen());
                    },
                    child: const Text(AppTexts.forgetPassword))
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    controller.emailAndPasswordSignIn();
                  },
                  child: const Text(AppTexts.signIn)),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(const SignUpScreen());
                  },
                  style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.transparent),
                      foregroundColor: WidgetStateProperty.all(
                          dark ? AppColors.light : AppColors.dark)),
                  child: const Text(AppTexts.createAccount)),
            ),
          ],
        ),
      ),
    );
  }
}
