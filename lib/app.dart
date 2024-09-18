import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/bindings/general_bindings.dart';
import 'package:my_store/routes/app_routes.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: GeneralBindings(),
        themeMode: ThemeMode.system, // set thteme mode to system
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        getPages: AppRoutes.page,
        home: const Scaffold(
          backgroundColor: AppColors.primary,
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ));
  }
}
