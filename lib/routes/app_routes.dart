import 'package:get/get.dart';
import 'package:my_store/features/authentication/screens/login/login.dart';
import 'package:my_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:my_store/features/authentication/screens/password_config/forget_password.dart';
import 'package:my_store/features/authentication/screens/signup/signup.dart';
import 'package:my_store/features/authentication/screens/signup/verify_email.dart';
import 'package:my_store/features/personalization/screens/address/address.dart';
import 'package:my_store/features/personalization/screens/profile/profile_screen.dart';
import 'package:my_store/features/personalization/screens/settings/settings_screen.dart';
import 'package:my_store/features/shop/screens/cart/cart.dart';
import 'package:my_store/features/shop/screens/checkout/checkout.dart';
import 'package:my_store/features/shop/screens/home/homescreen.dart';
import 'package:my_store/features/shop/screens/orders/order.dart';
import 'package:my_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:my_store/features/shop/screens/store/storescreen.dart';
import 'package:my_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:my_store/routes/routes.dart';

class AppRoutes {
  static final page = [
    GetPage(name: AllRoutes.home, page: () => const Homescreen()),
    GetPage(name: AllRoutes.store, page: () => const StoreScreen()),
    GetPage(name: AllRoutes.favourites, page: () => const WishListScreen()),
    GetPage(name: AllRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: AllRoutes.productReviews,
        page: () => const ProductReviewsScreen()),
    GetPage(name: AllRoutes.order, page: () => const OrderScreen()),
    GetPage(name: AllRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: AllRoutes.cart, page: () => const CartScreen()),
    GetPage(name: AllRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: AllRoutes.userAddress, page: () => const AddressScreen()),
    GetPage(name: AllRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: AllRoutes.verifyEmail, page: () => const verifyEmailScreen()),
    GetPage(name: AllRoutes.signIn, page: () => const LoginScreen()),
    GetPage(
        name: AllRoutes.forgetPassword,
        page: () => const ForgetPasswordScreen()),
    GetPage(name: AllRoutes.onBoarding, page: () => const OnboardingScreen()),
  ];
}
