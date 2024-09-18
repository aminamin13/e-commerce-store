import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_store/data/repositories/authentication_repository.dart';
import 'package:my_store/features/authentication/screens/password_config/reset_password.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/helpers/network_manager.dart';
import 'package:my_store/utils/loaders/snackbar.dart';
import 'package:my_store/utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();

  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          "Processing your request...", AppImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      await AutheticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      AppFullScreenLoader.stopLoading();

      AppLoaders.successSnackBar(
          title: "Email Sent!",
          message: "Email Link Sent to your Email Address");

      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      AppFullScreenLoader.stopLoading();

      AppLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          "Processing your request...", AppImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }
      await AutheticationRepository.instance.sendPasswordResetEmail(email);

      AppFullScreenLoader.stopLoading();

      AppLoaders.successSnackBar(
          title: "Email Sent!",
          message: "Email Link Sent to your Email Address".tr);
    } catch (e) {
      AppFullScreenLoader.stopLoading();

      AppLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
