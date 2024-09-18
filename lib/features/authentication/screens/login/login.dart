import 'package:flutter/material.dart';
import 'package:my_store/common/style/spacing_styles.dart';
import 'package:my_store/common/widgets/login_signup/form_divider.dart';
import 'package:my_store/common/widgets/login_signup/socail_media_login.dart';
import 'package:my_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:my_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: AppSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                /// logo, title, sibtitle
                LoginHeader(),
                LoginForm(),

                ///Divider
                FormDivider(
                  text: AppTexts.orSignInWith,
                ),
                SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),
                SocailMediaLogin()
              ],
            )),
      ),
    );
  }
}
