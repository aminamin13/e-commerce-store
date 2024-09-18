import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/common/widgets/success_screen/success_screen.dart';
import 'package:my_store/data/repositories/authentication_repository.dart';
import 'package:my_store/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:my_store/features/authentication/screens/login/login.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class verifyEmailScreen extends StatelessWidget {
  const verifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              AutheticationRepository.instance.logout();
            },
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// image
                Center(
                  child: Image(
                    image:
                        const AssetImage(AppImages.deliveredEmailIllustration),
                    width: AppHelperFunctions.screenWidth() * 0.8,
                  ),
                ),

                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),

                Text(
                  AppTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),

                Text(
                  email ?? "",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),
                Text(
                  AppTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.checkEmailVerificationStatus();
                      },
                      child: const Text(AppTexts.tContinue)),
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),

                TextButton(
                    onPressed: () {
                      controller.sendEmailVerification();
                    },
                    child: const Text(AppTexts.resendEmail)),

                /// title and subtitle

                ///buttons
              ],
            )),
      ),
    );
  }
}
