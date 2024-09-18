import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/image_strings.dart';
import 'package:my_store/utils/constants/text_strings.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 150,
            image: AssetImage(
                dark ? AppImages.lightAppLogo : AppImages.darkAppLogo)),
        Text(AppTexts.signupTitle,
            style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}
